//
//  RowData.swift
//  Example_BusinessComponents
//
//  Created by Vicente Veltri on 22/07/2020.
//  Copyright © 2020 Mercado Libre. All rights reserved.
//

import Foundation
import MLBusinessComponents

class RowData: NSObject, MLBusinessRowData {
    func getLeftImage() -> String? {
        return "https://urbancomunicacion.com/wp-content/uploads/2017/04/Logotipos-famosos-Starbucks-Urban-comunicacion-1.png"
    }
    
    func getLeftImageAccessory() -> String? {
        return "https://urbancomunicacion.com/wp-content/uploads/2017/04/Logotipos-famosos-Starbucks-Urban-comunicacion-1.png"
    }
    
    func getLeftImageStatus() -> String? {
        return nil
    }
    
    func getMainTitle() -> String {
        return "Starbucks"
    }
    
    func getMainSubtitle() -> String? {
        return "Cafetería"
    }
    
    func getMainDescription() -> [MLBusinessRowMainDescriptionData]? {
        return [RowMainDescriptionData(type: "image", content: "https://i.ibb.co/2KcdLdy/16-px.png", color: "#737373"),
                RowMainDescriptionData(type: "text", content: "598m", color: "#737373"),
                RowMainDescriptionData(type: "text", content: " · ", color: "#737373"),
                RowMainDescriptionData(type: "image", content: "https://i.ibb.co/prSV6dY/estrella-android.png", color: "#737373"),
                RowMainDescriptionData(type: "text", content: "4.3 (24)", color: "#737373"),]
    }
    
    func getMainSecondaryDescription() -> [MLBusinessMultipleDescriptionModel]? {
        
        return [MLBusinessMultipleDescriptionModel(type: "image", content: "https://i.ibb.co/bWSWDHc/icon-delivery-android.png", color: "#00a650"),
            MLBusinessMultipleDescriptionModel(type: "text", content: "Envío", color: "#00a650"),
            MLBusinessMultipleDescriptionModel(type: "text", content: " · ", color: "#00a650"),
            MLBusinessMultipleDescriptionModel(type: "image", content: "https://i.ibb.co/n8gJqYk/icon-pickup-android.png", color: "#00a650"),
            MLBusinessMultipleDescriptionModel(type: "text", content: "Retiro", color: "#00a650"),]
    }
    
    func getStatusDescription() -> [MLBusinessMultipleDescriptionModel]? {
        return nil
    }
    
    func getRightPrimaryLabel() -> String? {
        return "15%"
    }
    
    func getRightSecondaryLabel() -> String? {
        return "OFF"
    }
    
    func getRightMiddleLabel() -> String? {
        return "Tope de $100"
    }
    
    func getRightTopLabel() -> String? {
        return nil
    }
    
    func getRightLabelStatus() -> String? {
        return "BLOCKED"
    }
    
    func getRightBottomInfo() -> MLBusinessRowRightBottomInfoData? {
        return RowRightBottomInfoData()
    }
    
    func getLink() -> String? {
        return "mercadopago://scanqr"
    }
    
    func getMainTitleStatus() -> String? {
        return "CLOSED"
    }
}

extension RowData {
    func asModel() -> MLBusinessMultipleRowItemModel {
        let mainDescription = getMainDescription()?.compactMap({
            return MLBusinessRowMainDescription(type: $0.getType(), content: $0.getContent(), color: $0.getColor())
        })

        let bottomInfo = MLBusinessRowRightBottomInfo(icon: getRightBottomInfo()?.getIcon(),
                                                      label: getRightBottomInfo()?.getLabel(),
                                                      format: MLBusinessRowRightBottomInfoFormat(textColor: (getRightBottomInfo()?.getFormat()?.getTextColor())!,
                                                                                                 backgroundColor: (getRightBottomInfo()?.getFormat()?.getBackgroundColor())!))

        return MLBusinessMultipleRowItemModel(leftImage: getLeftImage(),
                                              leftImageAccessory: getLeftImageAccessory(),
                                              leftImageStatus: getLeftImageStatus(),
                                              mainTitle: getMainTitle(),
                                              mainSubtitle: getMainSubtitle(),
                                              mainDescription: mainDescription,
                                              mainSecondaryDescription: getMainSecondaryDescription(),
                                              statusDescription: getStatusDescription(),
                                              rightPrimaryLabel: getRightPrimaryLabel(),
                                              rightSecondaryLabel: getRightSecondaryLabel(),
                                              rightMiddleLabel: getRightMiddleLabel(),
                                              rightTopLabel: getRightTopLabel(),
                                              rightLabelStatus: getRightLabelStatus(),
                                              rightBottomInfo: bottomInfo,
                                              link: getLink(),
                                              tracking: createTrackingItem(trackingId: "1048784",
                                                                           blocked: false,
                                                                           name: "El Nombre"))
    }
    
    private func createTrackingItem(trackingId: String, blocked: Bool, name: String) -> MLBusinessItemModelTracking {
            return MLBusinessItemModelTracking(trackingId: trackingId, eventData: ["blocked" : blocked, "name" : name, "tracking_id" : trackingId])
        }
}

class RowMainDescriptionData: NSObject, MLBusinessRowMainDescriptionData {
    private let type: String
    private let content: String
    private let color: String?
    
    init(type:String, content: String, color: String? = nil) {
        self.type = type
        self.content = content
        self.color = color
    }
    
    
    func getType() -> String {
        return type
    }
    
    func getContent() -> String {
        return content
    }
    
    func getColor() -> String? {
        return color
    }
}

class RowRightBottomInfoData: NSObject, MLBusinessRowRightBottomInfoData {
    func getIcon() -> String? {
        return "https://urbancomunicacion.com/wp-content/uploads/2017/04/Logotipos-famosos-Starbucks-Urban-comunicacion-1.png"
    }
    
    func getLabel() -> String? {
        return "QUEDA 1 DÍA"
    }
    
    func getFormat() -> MLBusinessRowRightBottomInfoFormatData? {
        return RowRightBottomInfoFormatData()
    }
}

class RowRightBottomInfoFormatData: NSObject, MLBusinessRowRightBottomInfoFormatData {
    func getTextColor() -> String {
        return "#FF7733"
    }
    
    func getBackgroundColor() -> String {
        return "#FFFFFF"
    }
}

class ClosedRowData: RowData {
    override func getLeftImageStatus() -> String? {
        return "CLOSED"
    }
    
    override func getStatusDescription() -> [MLBusinessMultipleDescriptionModel]? {
        return [MLBusinessMultipleDescriptionModel(type: "text", content: "Cerrado · Abre el lunes", color: "#FF7733")]
    }
    
    override func getRightLabelStatus() -> String? {
        return "CLOSED"
    }
}
