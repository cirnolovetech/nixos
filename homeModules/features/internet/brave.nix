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
   { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; }
   { id = "jiaopdjbehhjgokpphdfgmapkobbnmjp"; }
  ];
 };

}

