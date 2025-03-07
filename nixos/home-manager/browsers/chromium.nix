{ pkgs, ... }:

{
 programs.chromium = {
  enable = true; 
  extraOpts = {
   "BrowserSignin" = "0";
   "SyncDisabled" = "true";
   "PasswordManagerEnabled" = "false";
   "BuiltInDnsClientEnabled" = "false";
   "DeviceMetricsReportingEnabled" = "true";
   "ReportDeviceCrashReportInfo" = "true";
   "SpellcheckEnabled" = "false";
   "CloudPrintSubmitEnabled" = "false";
  };
 }; 
}
