ProjectCode = 'PROGRAM %ModuleIdent;                         ' + #10#13 +
  '                                                          ' + #10#13 +
  '// C�digo gerado pelo Assistente MVCBr OTA                ' + #10#13 +
  '// www.tireideletra.com.br                                ' + #10#13 +
  '// Amarildo Lacerda & Grupo MVCBr-2017                    ' + #10#13 +
  'uses                                                      ' + #10#13 +
  '  Forms, MVCBr.ApplicationController, MVCBr.Controller;   ' + #10#13 +
  '                                                          ' + #10#13 +
  '{$R *.res}                                                ' + #10#13 +
  'begin                                                     ' + #10#13 +
'/// Inicializa o Controller e Roda o MainForm                     ' + #10#13 +
  '  ApplicationController.Run(T%ModuleIdentController.New,' + #10#13 +
  '    function :boolean                                     ' + #10#13 +
  '    begin                                                 ' + #10#13 +
  '      // retornar True se o applicatio pode ser carregado ' + #10#13 +
  '      //          False se n�o foi autorizado inicializa��o' + #10#13 +
  '      result := true;                                     ' + #10#13 +
  '    end);                                                 ' + #10#13 +
  'end.                                                      ' + #10#13;

ProjectCodeFMX = 'PROGRAM %ModuleIdent;                         ' + #10#13 +
  '                                                          ' + #10#13 +
  '// C�digo gerado pelo Assistente MVCBr OTA                ' + #10#13 +
  '// www.tireideletra.com.br                                ' + #10#13 +
  '// Amarildo Lacerda & Grupo MVCBr-2017                    ' + #10#13 +
  'uses                                                      ' + #10#13 +
  '  System.StartUpCopy,                                     ' + #10#13 +
  '  FMX.Forms, MVCBr.ApplicationController, MVCBr.Controller;' + #10#13 +
  '                                                          ' + #10#13 +
  '{$R *.res}                                                ' + #10#13 +
  'begin                                                     ' + #10#13 +
  '  ApplicationController.Run(T%ModuleIdentController.New,' + #10#13 +
  '    function :boolean                                     ' + #10#13 +
  '    begin                                                 ' + #10#13 +
  '      // retornar True se o applicatio pode ser carregado ' + #10#13 +
  '      //          False se n�o foi autorizado inicializa��o' + #10#13 +
  '      result := true;                                     ' + #10#13 +
  '    end);                                                 ' + #10#13 +
  'end.                                                      ' + #10#13;

