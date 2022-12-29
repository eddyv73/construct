//
//  main.swift
//  construct
//
//  Created by Eddy Wister on 28/12/22.
//



import Foundation

// variables generales
let _servicios = ["mfw", "mw", "aaf", "rec","pay","xdk"]
let _product = "cvideo"

// variables silo ott
let _longPart = "clarodom"
let _parititon = "dom"

// variables silo iptv
let _longPartiptv = "clarodominicana"
let _parititoniptv = "cdominicana"

var resultados = [String]()

func generarResultados(dc: String, region: String, env: String, longPart: String, silo: String , partition: String) {
    let servicios = _servicios
    var resultados = [String]()

    func concatenarCadena(dc: String, region: String, partition: String, product: String, servicio: String, silo: String, env: String, longPart: String) -> String {
        return "az pipelines variable-group create --name " + partition  + "-" + dc + "-" + region + "-" + env + "-" + servicio + " --project ClaroVideo  --org https://dev.azure.com/clarovideo --variables dc=" + dc + " region=" + region + " partition=" + partition + " product=" + product + " servicio=" + servicio + " silo=" + silo + " env=" + env + " long_part=" + longPart
    }

    for servicio in servicios {
        let resultado = concatenarCadena(dc: dc, region: region, partition: partition, product: _product, servicio: servicio, silo: silo, env: env, longPart: longPart)
        resultados.append(resultado)
    }

    for resultado in resultados.sorted() {
        print(resultado)
    }
}

//ott
generarResultados(dc: "azr", region: "eastus2", env: "prd", longPart: _longPart, silo: "ott", partition: _parititon)
generarResultados(dc: "aws", region: "us-east-1", env: "prd", longPart: _longPart, silo: "ott", partition: _parititon)
generarResultados(dc: "aws", region: "us-east-2", env: "uat", longPart: _longPart, silo: "ott", partition: _parititon)
//iptv
generarResultados(dc: "azr", region: "eastus2", env: "prd", longPart: _longPartiptv, silo: "iptv", partition: _parititoniptv)
generarResultados(dc: "aws", region: "us-east-1", env: "prd", longPart: _longPartiptv, silo: "iptv", partition: _parititoniptv)
generarResultados(dc: "aws", region: "us-east-2", env: "uat", longPart: _longPartiptv, silo: "iptv", partition: _parititoniptv)

