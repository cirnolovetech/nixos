{ pkgs, ... }:

{
 programs.firefox = {
  enable = true;
  package = pkgs.librewolf;
  policies = {
   DisableTelemetry = true;
   DisableFirefoxStudies = true;
   Preferences = {
    "cookiebanners.service.mode.privateBrowsing" = 2;
    "cookiebanners.service.mode" = 2;
    "privacy.donottrackheader.enabled" = true;
    "privacy.fingerprintingProtection" = true;
    "privacy.resistFingerprinting" = true;
    "privacy.trackingprotection.emailtracking.enabled" = true;
    "privacy.trackingprotection.enabled" = true;
    "privacy.trackingprotection.fingerprinting.enabled" = true;
    "privacy.trackingprotection.socialtracking.enabled" = true;
   };
  };
 };
}
