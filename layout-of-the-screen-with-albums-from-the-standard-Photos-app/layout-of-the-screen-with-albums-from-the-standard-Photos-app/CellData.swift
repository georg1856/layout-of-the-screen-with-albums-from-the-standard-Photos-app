//
//  CellData.swift
//  layout-of-the-screen-with-albums-from-the-standard-Photos-app
//
//  Created by Георгий on 18.06.2022.
//

import Foundation

struct CellData {
    static func setCellsMyAlbumsSection() -> [CellModel] {

        let myAlbumCellFirst = CellModel(imageName: "first",
                                  labelName: "Недавние",
                                  labelCount: "6 719")

        let myAlbumCellSecond = CellModel(imageName: "second",
                                       labelName: "Избранное",
                                       labelCount: "83")

        let myAlbumCellThird = CellModel(imageName: "third",
                                     labelName: "Для инсты",
                                     labelCount: "32")

        let myAlbumCellFourth = CellModel(imageName: "fourth",
                                   labelName: "WhatsApp",
                                   labelCount: "0")

        let myAlbumCellFifth = CellModel(imageName: "fifth",
                                    labelName: "Instagram",
                                    labelCount: "100")

        let myAlbumCellSixth = CellModel(imageName: "sixth",
                                   labelName: "Telegram",
                                   labelCount: "53")

        let myAlbumCellSeventh = CellModel(imageName: "seventh",
                                   labelName: "Работа",
                                   labelCount: "99")

        let myAlbumCellEight = CellModel(imageName: "eighth",
                                   labelName: "Природа",
                                   labelCount: "123")

        return [myAlbumCellFirst,
                myAlbumCellSecond,
                myAlbumCellThird,
                myAlbumCellFourth,
                myAlbumCellFifth,
                myAlbumCellSixth,
                myAlbumCellSeventh,
                myAlbumCellEight]
    }

    static func setCellsSharedAlbumsSection() -> [CellModel] {

            let sharedAlbumsCellFirst = CellModel(imageName: "ninth",
                      labelName: "Заставки",
                      labelCount: "391")

            let sharedAlbumsCellSecond = CellModel(imageName: "tenth",
                      labelName: "Фотошоп",
                      labelCount: "109")

            let sharedAlbumsCellThird = CellModel(imageName: "eleventh",
                      labelName: "Загрузки",
                      labelCount: "574")

            let sharedAlbumsCellFourth = CellModel(imageName: "twelfth",
                      labelName: "Выложить",
                      labelCount: "51")

        return [sharedAlbumsCellFirst,
                sharedAlbumsCellSecond,
                sharedAlbumsCellThird,
                sharedAlbumsCellFourth]
    }

    static func setCellsTypesMediaFilesSection() -> [CellModel] {

        let firstFile = CellModel(imageName: "video",
                                  labelName: "Видео",
                                  labelCount: "6")

        let secondFile = CellModel(imageName: "person.crop.square",
                                   labelName: "Селфи",
                                   labelCount: "118")

        let thirdFile = CellModel(imageName: "viewfinder.circle",
                                  labelName: "Фото Live Photos",
                                  labelCount: "72")

        let fourthFile = CellModel(imageName: "cube",
                                   labelName: "Портреты",
                                   labelCount: "133")

        let fiveFile = CellModel(imageName: "rectangle.portrait.arrowtriangle.2.outward",
                                 labelName: "Панорамы",
                                 labelCount: "1")

        let sixthFile = CellModel(imageName: "camera.viewfinder",
                                  labelName: "Снимки экрана",
                                  labelCount: "154")

        return [firstFile,
                secondFile,
                thirdFile,
                fourthFile,
                fiveFile,
                sixthFile]
    }

    static func setCellsOtherSection() -> [CellModel] {
        let firstOther = CellModel(imageName: "square.and.arrow.down",
                                   labelName: "Импортированные",
                                   labelCount: "1011")

        let secondOther = CellModel(imageName: "eye.slash",
                                    labelName: "Скрытые",
                                    labelCount: "0")

        let thirdOther = CellModel(imageName: "trash",
                                   labelName: "Недавно удаленные",
                                   labelCount: "4")

        return [firstOther,
                secondOther,
                thirdOther]
    }
}
