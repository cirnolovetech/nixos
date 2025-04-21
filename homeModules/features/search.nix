{ pkgs, ... }:

{

 programs.chromium = {
  enable = true;
  package = pkgs.brave;
  extensions = [
   { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } 
   { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; }
   { id = "dneaehbmnbhcippjikoajpoabadpodje"; }
   { id = "kbmfpngjjgdllneeigpgjifpgocmfgmb"; }
   { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
   { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
   { id = "jiaopdjbehhjgokpphdfgmapkobbnmjp"; }
   { id = "egnjhciaieeiiohknchakcodbpgjnchh"; }
  ];
 };

}

