//------------------------------------------- [Init 에 필요한 정보] --------------------------------------------------------------------//
// 서버인증서(Base64Encode)
var ServerCert   		= "MIID5jCCAs6gAwIBAgIQR8+pYwNMEeJ6C+r1FlarGTANBgkqhkiG9w0BAQUFADBQMQswCQYDVQQGEwJLUjEcMBoGA1UEChMTR292ZXJubWVudCBvZiBLb3JlYTENMAsGA1UECxMER1BLSTEUMBIGA1UEAxMLQ0ExMzEwMDAwMDEwHhcNMDgwMzA2MDgyMDUxWhcNMTAwNjA2MDgyMDUxWjBdMQswCQYDVQQGEwJLUjEcMBoGA1UECgwTR292ZXJubWVudCBvZiBLb3JlYTEYMBYGA1UECwwPR3JvdXAgb2YgU2VydmVyMRYwFAYDVQQDDA1TVlI5OTk5MDQ3MDE2MIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgH+DJtuBkCEbvAbtXOH7nL6L/TPIxBVcFIP/Z7fZreGxXw7O9YIcLpjNOh1/mJxsJWtxDFODsytIkmbqFc0uRRmdawhRq7HeZcyDHDCHB6AEReoXmQiiXsN0pj8jh1SqE/JQ+TVx0Cv3B5lHhLt5DDjueVz8GxfGmRUckw04OjPXAgMBAAGjggEyMIIBLjAfBgNVHSMEGDAWgBQBzxeuBI2HzLdVC3Fsa0ic5rGylTAdBgNVHQ4EFgQUHLb52xJ38rG9Pr2Ku7I4v/l+al4wDgYDVR0PAQH/BAQDAgUgMBgGA1UdIAQRMA8wDQYJKoMaho0hAgECMAAwgYkGA1UdHwSBgTB/MH2ge6B5hndsZGFwOi8vbGRhcC5nY2MuZ28ua3I6Mzg5L2NuPWNybDAwMDksY249Q0ExMzEwMDAwMDEsb3U9R1BLSSxvPUdvdmVybm1lbnQgb2YgS29yZWEsYz1LUj9jZXJ0aWZpY2F0ZVJldm9jYXRpb25saXN0O2JpbmFyeTA2BggrBgEFBQcBAQQqMCgwJgYIKwYBBQUHMAGGGmh0dHA6Ly9ndmEuZ3BraS5nby5rcjo4MDgwMA0GCSqGSIb3DQEBBQUAA4IBAQA1xAPIioaRWVXxVWKFXX1miJABw0paS0UYs9hf0gsUmsN/zc4VjmBqFcieqQwjXO7LWltP/ta/i9B5L+ZOhcXIjjhnl8gdqqfzwd0wnFqFjY4cMg548gC9zGSBSXhR2U3P92iCN4NBKbyQerIgSe7/savUK9rNkzVxV2cJ5Ejfiw9KihdzJQrRWQoPW0GCTT+3HZkal+u5zS0Pj/ITARodw7AOa8+DAM1qP/lBForNkTJuygJohXv2DFDNTRKjT8ZDjV0L/xJ3LUTAcOXuHIf3ImFCehOHqV7ZM0g2aHnLqLepW3GktGtjuT3QN7s2ZHKIodpaKgCV8BoZ9CYhUFrq";

var AlgoMode 			= 0x40;				         			// 암복호 알고리즘 (
												// 0x20 : SYM_ALG_3DES_CBC, 
												// 0x30 : SYM_ALG_SEED_CBC, 
												// 0x40 : SYM_ALG_NEAT_CBC, 
												// 0x50 : SYM_ALG_ARIA_CBC,
			         								// 0x60 : SYM_ALG_NES_CBC)

var WorkDir		        = "GPKISecureWeb";						// 작업디렉토리(모듈 설치된 위치) 		

var GNCertType  		= 0x00;				        // GPKI, NPKI 인증서 모두 :  0x00
									// GPKI : 0x01
									// NPKI : 0x02
									// NPKI : 0x04	
var ValidCertInfo 		= "";

//var ValidCertInfo 		= "1 2 410 100001 2 2 1|1 2 410 100001 2 1 2|";			// 특정인증서만 로딩 할 경우에 정책코드를 나열한다.	
var ValidCertInfo 		= "";			// 특정인증서만 로딩 할 경우에 정책코드를 나열한다.	


var ReadCertType 		= 0x01; 				        		// 서명용인증서 : 0x01, 암호키분배용 인증서 : 0x02

var KeyStrokeType 		= 0x00;			 	         			// 키보드 보안 API ( 0x00 : 적용안함 )
												//(0x01:softcamp, 0x02:INCA, 0x03:Ahnlab, 0x04:Soft Security, 0x05:Space International)

// 휴대폰 인증서
var UbikeyVersion = "1.0.4.5";
var UbikeyPopupURL = "http://www.gpki.go.kr/wire/infovine/download.html";
var UbikeyWParam = "MOPAS";
var UbikeylParam = "DREAMSECURITY|KEYBOARD_SECURITY_COMP_CODE";


var CertOption			= 0x01;				// 0x00 : 로그인한 세션인증서로만 서명한다. (해당인증서만 로딩한다.) 
var EncodeOption		= 0x00;				// 0x01 : 서명할 데이터가 Base64Encode됨. 0x00 : 서명할 데이터가 Base64Encode되지 않음.

// SiteID
var SiteID 			= "Test_GPKI";			        		        // SiteID :세션정보를 획득하는 키값

// 서명시에 
// [setup.conf : 설치파일 위치정보]

// GPKIInstaller 사용시
		
var ServerAddr 			= "127.0.0.1:80"; 				
var ConfigFilePath 		= "/gpkisecureweb/setup/setup.conf";

// [설치 파일 경로 변수(html내부에서 사용됨)]

var SetupOffLineFilePath        = "/gpkisecureweb/setup/install_off_v1.0.4.9.exe";

// [설치완료후 이동할 페이지 설정]
var ServiceStartPageURL		= "/gpkisecureweb/index.html";


//---------------------------------------------- [ActiveX 버전번호] --------------------------------------------------------------------//

// [ActiveX Object 테그 형태]																					

var CodeBase_GPKIInstaller	= " CODEBASE='http://127.0.0.1:80/gpkisecureweb/setup/GPKIInstaller.cab#version=1,0,1,8'";

var Object_GPKIInstaller 	= "<OBJECT ID ='GPKIInstaller' CLASSID = 'CLSID:531BBB4D-B043-4D70-8A88-0A416C7F7CD0' width = 0 height =0";
Object_GPKIInstaller            += CodeBase_GPKIInstaller;
Object_GPKIInstaller            += "></OBJECT >";
