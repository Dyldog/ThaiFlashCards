//
//  ThaiConsonant.swift
//  ThaiFlashCards
//
//  Created by Dylan Elliott on 11/9/2023.
//

import Foundation

enum ThaiConsontantClass {
    case low
    case middle
    case high
    
    init?(_ string: String) {
        switch string {
        case "low": self = .low
        case "mid": self = .middle
        case "high": self = .high
        default: return nil
        }
    }
}

struct ThaiConsonant {
    let script: String
    let name: String
    let initialSound: String
    let finalSound: String
    let `class`: ThaiConsontantClass
}

extension ThaiConsonant: CardDisplayable {
    static var allCases: [ThaiConsonant] = """
        ก,ก ไก่,ko kai,chicken,k,k,/k/,/k/,mid
        ข,ข ไข่,kho khai,egg,kh,k,/kʰ/,/k/,high
        ฃ,ฃ ขวด,kho khuat,bottle (obsolete),kh,k,/kʰ/,/k/,high
        ค,ค ควาย,kho khwai,buffalo,kh,k,/kʰ/,/k/,low
        ฅ,ฅ คน,kho khon,person (obsolete),kh,k,/kʰ/,/k/,low
        ฆ,ฆ ระฆัง,kho rakhang,bell,kh,k,/kʰ/,/k/,low
        ง,ง งู,ngo ngu,snake,ng,ng,/ŋ/,/ŋ/,low
        จ,จ จาน,cho chan,plate,ch,t,/tɕ/,/t/,mid
        ฉ,ฉ ฉิ่ง,cho ching,cymbals,ch,–,/tɕʰ/,–,high
        ช,ช ช้าง,cho chang,elephant,ch,t,/tɕʰ/,/t/,low
        ซ,ซ โซ่,so so,chain,s,t,/s/,/t/,low
        ฌ,ฌ เฌอ,cho choe,tree,ch,t,/tɕʰ/,/t/,low
        ญ,ญ หญิง,yo ying,woman,y,n,/j/,/n/,low
        ฎ,ฎ ชฎา,do chada,headdress,d,t,/d/,/t/,mid
        ฏ,ฏ ปฏัก,to patak,"goad or javelin",t,t,/t/,/t/,mid
        ฐ,ฐ ฐาน,tho than,pedestal,th,t,/tʰ/,/t/,high
        ฑ,ฑ มณโฑ,tho montho,"Montho - character from Ramayana",th or d,t,/tʰ/ or /d/,/t/,low
        ฒ,ฒ ผู้เฒ่า,tho phu thao,elder,th,t,/tʰ/,/t/,low
        ณ,ณ เณร,no nen,samanera,n,n,/n/,/n/,low
        ด,ด เด็ก,do dek,child,d,t,/d/,/t/,mid
        ต,ต เต่า,to tao,turtle,t,t,/t/,/t/,mid
        ถ,ถ ถุง,tho thung,sack,th,t,/tʰ/,/t/,high
        ท,ท ทหาร,tho thahan,soldier,th,t,/tʰ/,/t/,low
        ธ,ธ ธง,tho thong,flag,th,t,/tʰ/,/t/,low
        น,น หนู,no nu,mouse,n,n,/n/,/n/,low
        บ,บ ใบไม้,bo baimai,leaf,b,p,/b/,/p/,mid
        ป,ป ปลา,po pla,fish,p,p,/p/,/p/,mid
        ผ,ผ ผึ้ง,pho phueng,bee,ph,–,/pʰ/,–,high
        ฝ,ฝ ฝา,fo fa,lid,f,–,/f/,–,high
        พ,พ พาน,pho phan,phan,ph,p,/pʰ/,/p/,low
        ฟ,ฟ ฟัน,fo fan,tooth,f,p,/f/,/p/,low
        ภ,ภ สำเภา,pho samphao,junk,ph,p,/pʰ/,/p/,low
        ม,ม ม้า,mo ma,horse,m,m,/m/,/m/,low
        ย,ย ยักษ์,yo yak,"giant or yaksha",y,"– or n",/j/,"/j/ or /n/",low
        ร,ร เรือ,ro ruea,boat,r,n,/r/,/n/,low
        ล,ล ลิง,lo ling,monkey,l,n,/l/,/n/,low
        ว,ว แหวน,wo waen,ring,w,–,/w/,/w/,low
        ศ,ศ ศาลา,so sala,"pavilion or sala",s,t,/s/,/t/,high
        ษ,ษ ฤๅษี,so ruesi,hermit,s,t,/s/,/t/,high
        ส,ส เสือ,so suea,tiger,s,t,/s/,/t/,high
        ห,ห หีบ,ho hip,"chest or box",h,–,/h/,–,high
        ฬ,ฬ จุฬา,lo chula,kite,l,n,/l/,/n/,low
        อ,อ อ่าง,o ang,basin,–,–,/ʔ/,–,mid
        ฮ,ฮ นกฮูก,ho nok huk,owl,h,–,/h/,–,low
        """
        .components(separatedBy: "\n")
        .map {
            let columns = $0.components(separatedBy: ",")
            guard let type = ThaiConsontantClass(columns[8]) else {
                fatalError("Could not make type from line: \($0)")
            }
            return .init(
                script: columns[0], name: columns[1], initialSound: columns[4], finalSound: columns[5], class: type
            )
        }
    
    var cardContent: CardContent {
        return (
            .init(.largeText(self.script), alternateSpokenText: self.name),
            .init(.sectionedText([
                ("Initial sound:", self.initialSound),
                ("Final sound:", self.finalSound)
            ]))
        )
    }
}
