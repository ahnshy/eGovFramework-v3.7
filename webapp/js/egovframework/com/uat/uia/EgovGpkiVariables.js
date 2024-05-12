

//------------------------------------------- [Init 에 필요한 정보] --------------------------------------------------------------------//
// 서버인증서(Base64Encode)
var ServerCert   		= "MIID5jCCAs6gAwIBAgIQSYexPQLd1LW4+HKjW0HZIDANBgkqhkiG9w0BAQUFADBQMQswCQYDVQQGEwJLUjEcMBoGA1UEChMTR292ZXJubWVudCBvZiBLb3JlYTENMAsGA1UECxMER1BLSTEUMBIGA1UEAxMLQ0ExMzEwMDAwMDEwHhcNMDkwMjAzMDI1MTQxWhcNMTEwNTAzMDI1MTQxWjBdMQswCQYDVQQGEwJLUjEcMBoGA1UECgwTR292ZXJubWVudCBvZiBLb3JlYTEYMBYGA1UECwwPR3JvdXAgb2YgU2VydmVyMRYwFAYDVQQDDA1TVlIxMzExMDAwMDExMIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgEWtLpCHdiiIql8cya4QU110sKZWCFVJkGqQU9VnKWeDfSuawbxIDcUZ806bADEIzTCiJ93iixsDTZbKLi4FW683f9+PNrI3Qhc1N0mQ/K6BNT20NH1RvhINXptsKr0+BaRRjRO1rZ11INHLj9eC9tpOP1RbPt17vNSEVQJeSM1bAgMBAAGjggEyMIIBLjAfBgNVHSMEGDAWgBQBzxeuBI2HzLdVC3Fsa0ic5rGylTAdBgNVHQ4EFgQUHyZEYWloVTQghYTbvB5chlKgRNYwDgYDVR0PAQH/BAQDAgUgMBgGA1UdIAQRMA8wDQYJKoMaho0hAgECMAAwgYkGA1UdHwSBgTB/MH2ge6B5hndsZGFwOi8vbGRhcC5nY2MuZ28ua3I6Mzg5L2NuPWNybDAwMTQsY249Q0ExMzEwMDAwMDEsb3U9R1BLSSxvPUdvdmVybm1lbnQgb2YgS29yZWEsYz1LUj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25saXN0O2JpbmFyeTA2BggrBgEFBQcBAQQqMCgwJgYIKwYBBQUHMAGGGmh0dHA6Ly9ndmEuZ3BraS5nby5rcjo4MDgwMA0GCSqGSIb3DQEBBQUAA4IBAQBW1qIyTKmabx1rTYazMKE7B22Knum7/bFeqDmzHKXPdIbxCtj5VmcFV/hQLYkMwor2lB27gpGUpqgcPj+5Hazd3nM9bmL+R+IBm6qKtWPfWDT8aN2wczSpW794h89J9i2hNqLTiyTZNgJE87IJND+zqwMAvP9JUX380b7MF1Gtsc5NLuXijA0eRhfhuyGoEUUbULeDf759VYMGBidmGvcJBM7afLPG0ZcNojTdwkdlXa4RoXYe9ps5wn78sjUcJox3ChOaWsZmqMw7+4OTTjO18ohAiBu5mdUtyrhnB/SYtvPElp1TUMXNh7csQBMmnXENKw8BAuo/sWxrKQbXWJl8";
var AlgoMode 			= 0x40;				         			// 암복호 알고리즘 (0x20 : SYM_ALG_3DES_CBC, 
																//					0x30 : SYM_ALG_SEED_CBC, 
																//					0x40 : SYM_ALG_NEAT_CBC, 
																//					0x50 : SYM_ALG_ARIA_CBC)	
			         											//					0x60 : SYM_ALG_NES_CBC)
var WorkDir				= "GPKISecureWeb";						// 작업디렉토리(모듈 설치된 위치) 		
var GNCertType  		= 0x01;				         			// GPKI, NPKI 인증서 모두 : 0x00, GPKI 만 : 0x01, NPKI 만 :0x02	
var ValidCertInfo 		= "";
//var ValidCertInfo 		= "1 2 410 100001 2 2 1|";			// 특정인증서만 로딩 할 경우에 정책코드를 나열한다.	
var ReadCertType 		= 0x01; 				        		// 서명용인증서 : 0x01, 암호키분배용 인증서 : 0x02
var KeyStrokeType 		= 0x00;			 	         			// 키보드 보안 API (0x01 : softcamp, 0x00 : 적용안함)
var CertOption			= 0x01;									// 0x00 : 로그인한 세션인증서로만 서명한다. (해당인증서만 로딩한다.) 

// SiteID
var SiteID 				= "Test_GPKI";			        		// SiteID :세션정보를 획득하는 키값

// 서명시에 
// [setup.conf : 설치파일 위치정보]

// GPKIInstaller 사용시
var ServerAddr					= "192.168.200.23:9004";	// JEUS	
//var ServerAddr 				= "192.168.200.23:8031";	// JBOSS
//var ServerAddr	 			= "192.168.200.23:8032";	// WEBLOGIC
var ConfigFilePath 				= "/html/egovframework/com/uat/uia/setup/setup.conf";

// [설치 파일 경로 변수(html내부에서 사용됨)]
var SetupOffLineFilePath    = "/html/egovframework/com/uat/uia/install_off_v1.0.4.9.exe";

// [설치완료후 이동할 페이지 설정]
var ServiceStartPageURL		= "/uat/uia/egovLoginUsr.do";

var UbikeyVersion = "1.0.3.1";
var UbikeyPopupURL = "http://www.gpki.go.kr/wire/infovine/download.html";
var UbikeyWParam = "SITE_NAME|";
var UbikeylParam = "DREAMSECURITY|KEYBOARD_SECURITY_COMP_CODE";

//---------------------------------------------- [ActiveX 버전번호] --------------------------------------------------------------------//

// [ActiveX Object 테그 형태]																					 
// var CodeBase_GPKIInstaller	= " CODEBASE='http://localhost:8080/html/egovframework/com/cmm/uat/uia/GPKIInstaller.cab#version=1,0,0,1'";
var CodeBase_GPKIInstaller	= " CODEBASE='http://192.168.200.23:9004/html/egovframework/com/cmm/uat/uia/GPKIInstaller.cab#version=1,0,0,8'";
var Object_GPKIInstaller 		= "<OBJECT ID ='GPKIInstaller' CLASSID = 'CLSID:531BBB4D-B043-4D70-8A88-0A416C7F7CD0' width = 0 height =0";
Object_GPKIInstaller     		+= CodeBase_GPKIInstaller;
Object_GPKIInstaller    		+= "></OBJECT >";
document.write(Object_GPKIInstaller);
