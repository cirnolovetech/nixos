{ pkgs, ... }:

{

 # Enabling Chromium HM Management
 programs.chromium = {
  enable = true;
  # Brace
  package = pkgs.brave;

  # Extensions
  extensions = [
   { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } 
   { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; }
   { id = "dneaehbmnbhcippjikoajpoabadpodje"; }
   { id = "kbmfpngjjgdllneeigpgjifpgocmfgmb"; }
   { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
   { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
   { id = "jiaopdjbehhjgokpphdfgmapkobbnmjp"; }
   { id = "egnjhciaieeiiohknchakcodbpgjnchh"; }
   { id = "mafpmfcccpbjnhfhjnllmmalhifmlcie"; }
  ];
 };

}

