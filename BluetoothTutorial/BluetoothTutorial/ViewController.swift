//
//  ViewController.swift
//  BluetoothTutorial
//
//  Created by Miguel Silva da Rocha Junior on 8/4/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    
    
    // MARK: - Properties
    let timerPauseInterval: TimeInterval = 10.0
    let timerScanInterval: TimeInterval = 2.0
    
    // MARK: UI Related 
    let temperatureLabelFontName = "HelveticaNeue-Thin"
    let temperatureLabelFontSizeMessage:CGFloat = 56.0
    let temperatureLabelFontSizeTemp:CGFloat = 81.0
    
    var keepScanning = false

    
    var foundDevices: [CBPeripheral] = []

    
    // MARK: CoreBLuetooth related
    var centralManager: CBCentralManager!
    var padLock: CBPeripheral?
    
    var temperatureCharacteristic:CBCharacteristic?
    var humidityCharacteristic:CBCharacteristic?
    
    // MARK: Padlock services and characteristics
    var service: CBUUID = CBUUID(string: "0000ffe0-0000-1000-8000-00805f9b34fb")
    var characteristic: CBUUID = CBUUID(string: "0000fff1-0000-1000-8000-00805f9b34fb")
    
    
    // This could be simplified to "SensorTag" and check if it's a substring.
    // (Probably a good idea to do that if you're using a different model of
    // the SensorTag, or if you don't know what model it is...)
    let padLockName = ""
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
    }
    
    /*
    
        This function is called at first and everytimes the bluetooth changes its state
     
     */
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        var showAlert = true
        var message = ""
        
        switch central.state {
        case .poweredOff:
            message = "Bluetooth on this device is currently powered off."
        case .unsupported:
            message = "This device does not support BLE"
        case .unauthorized:
            message = "This app is not authorized to use BLE"
        case .resetting:
            message = "The BLE Manager is ressetting. A state update is pending."
        case .unknown:
            message = "Could now resolver the state of the BLE Manager."
        case .poweredOn:
            showAlert = false
            message = "The BLE is ON and ready for communication!"
            
            print(message)
            keepScanning = true
            Timer.scheduledTimer(timeInterval: timerScanInterval, target: self, selector: #selector(pauseScan), userInfo: nil, repeats: false)
            
            // Initiate Scan for Peripherals
            //Option 1: Scan for all devices
            centralManager.scanForPeripherals(withServices: nil, options: nil)
            
            /* Option 2: Scan for devices that have the service you're interested in... */
            //let padLockAdvertisingUUID = CBUUID(string: Device.padLockAdvertisingUUID)
            //print("Scanning for padLock adverstising with UUID: \(padLockAdvertisingUUID)")
            //centralManager.scanForPeripheralsWithServices([padLockAdvertisingUUID], options: nil)
        }
    }
    
    func pauseScan() {
        // Scanning uses up battery on phone, so pause the scan process for the designated interval.
        print("*** PAUSING SCAN...")
        Timer.scheduledTimer(timeInterval: timerPauseInterval, target: self, selector: #selector(resumeScan), userInfo: nil, repeats: false)
        centralManager.stopScan()
        disconnectButton.isEnabled = true
    }
    
    
    func resumeScan() {
        if keepScanning {
            // Start scanning again...
            print("*** RESUMING SCAN!")
            disconnectButton.isEnabled = false
 
            temperatureLabel.font = UIFont(name: temperatureLabelFontName, size: temperatureLabelFontSizeMessage)
            temperatureLabel.text = "Searching"
            Timer.scheduledTimer(timeInterval: timerScanInterval, target: self, selector: #selector(pauseScan), userInfo: nil, repeats: false)
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            disconnectButton.isEnabled = true
        }
    }
    
    
    /*
     Invoked when the central manager discovers a peripheral while scanning.
     
     The advertisement data can be accessed through the keys listed in Advertisement Data Retrieval Keys.
     You must retain a local copy of the peripheral if any command is to be performed on it.
     In use cases where it makes sense for your app to automatically connect to a peripheral that is
     located within a certain range, you can use RSSI data to determine the proximity of a discovered
     peripheral device.
     
     central - The central manager providing the update.
     peripheral - The discovered peripheral.
     advertisementData - A dictionary containing any advertisement data.
     RSSI - The current received signal strength indicator (RSSI) of the peripheral, in decibels.
     
     */
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //print("central Manager didDiscover perfipherail - CBAdvertisementDataLocalNameKey is \(CBAdvertisementDataLocalNameKey)")
        
        if let peripheralName = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            let trimmedName = peripheralName.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmedName == "Smartlock" {
                if !foundDevices.contains(peripheral) {
                    print ("FOUND NEW DEVICE!")
                    print ("MY PERIPHERAL NAME IS: \(peripheralName)")
                    print ("MY PERIPHERAL UUID IS: \(peripheral.identifier.uuidString)")
                    foundDevices.append(peripheral)
                } else if foundDevices.count == 1 {
                    print("ALL PADLOCKS FOUND!")
                    
                    // To save power, stop sacanning for other devices
                    keepScanning = false
                    disconnectButton.isEnabled = true
                    
                    //save a reference to the sensor tag
                    padLock = foundDevices[0] //The first padlock found by the application
                    padLock!.delegate = self as CBPeripheralDelegate
                    
                    //Request a connection to the peripheral
                    centralManager.connect(padLock!, options: nil)
                    
                }
            }
        }
    }
    

    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("\n\n********* SUCCESFULLY CONNECTED TO THE PADLOCK  WITH UUID: \(foundDevices[0].identifier.uuidString) ************")
        
        temperatureLabel.text = "Connected!"
        
        // Now that we've succesfully connected to the PADLOCK, let's discover the services
        
        // - NOTE: we pass nil here to request ALL services do be discovered
        //       If there was a subset of services we are interested in, we could pass the UUIDs here.
        //  Doing so saves batter life and saves time.
        peripheral.discoverServices(nil)
    }
    
    
    /*
     Invoked when you discover the peripheral’s available services.
     
     This method is invoked when your app calls the discoverServices: method.
     If the services of the peripheral are successfully discovered, you can access them
     through the peripheral’s services property.
     
     If successful, the error parameter is nil.
     If unsuccessful, the error parameter returns the cause of the failure.
     */
    // When the specified services are discovered, the peripheral calls the peripheral:didDiscoverServices: method of its delegate object.
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
        print(" \n START didDiscoverServices \n")
        
        if error != nil {
            print ("ERROR DISCOVERING SERVICES: \(String(describing: error?.localizedDescription))")
            return
        }
        
        // (1) First we create an NSData object that holds one byte of information with the value of 1, which will enable the sensor we wish to turn on.
        var enableValue:UInt8 = 1
        //let enableBytes = NSData(bytes: &enableValue, length: MemoryLayout<UInt8>.size)
        
        // CoreBluetooth creates an array of CBService objects -- one for each service that is discovered on the peripheral.
        if let services = peripheral.services {
            for service in services {
                print("Discovered service \(service) ")
                //peripheral.discoverCharacteristics([self.characteristic], for: service)
                //peripheral.discoverCharacteristics(nil, for: service)
                
                if service.uuid == self.service {
                    print ("    SERVICE MATCH FOR \(service.uuid.uuidString)!")
                    peripheral.discoverCharacteristics(nil, for: service)
                }
            }
        }
    }

    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if error != nil {
            print("There was an error discovering characteristics: \(String(describing: error?.localizedDescription))")
        }
        
        print(" \n >>> Printing all characteristics for service \(service.uuid) \n")
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print(characteristic)
                padLock?.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if error != nil {
            print("ERROR ON UPDATING VALUE FOR CHARACTERISTIC: \(characteristic) - \(String(describing: error?.localizedDescription))")
        }
        
        // extract the data from the characteristic's value property and display the value based on the characteristic type
        if let dataBytes = characteristic.value {
            if characteristic.uuid == self.characteristic {
                print(dataBytes)
            }
        }
    }
    
    

}




