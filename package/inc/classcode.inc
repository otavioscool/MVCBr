ClassHeader=
'{//************************************************************//}'+ #10#13 +
'{//                                                            //}'+ #10#13 +
'{//         C�digo gerado pelo assistente                      //}'+ #10#13 +
'{//                                                            //}'+ #10#13 +
'{//         Projeto MVCBr                                      //}'+ #10#13 +
'{//         tireideletra.com.br  / amarildo lacerda            //}'+ #10#13 +
'{//************************************************************//}'+ #10#13 +
'{// Data: %date                                  //}'+ #10#13 +
'{//************************************************************//}';

ClassCode = 'unit %ModuleIdent;                                 ' + #10#13 +
  '                                                    ' + #10#13 +
  ' ///                                                ' + #10#13 +
  ' /// <summary>                                            ' + #10#13 +
  ' ///    O Model recebe as regras de neg�cios        ' + #10#13 +
  ' ///    do sistema.                                 ' + #10#13 +
  ' /// </ummary>                                            ' + #10#13 +
  ' ///                                                ' + #10#13 +
  'interface                                                 ' + #10#13 +
  'uses                                                      ' + #10#13 +
  '  System.SysUtils,{$ifdef FMX} FMX.Forms,{$else} VCL.Forms,{$endif} System.Classes,' + #10#13 +
  '  MVCBr.Interf, MVCBr.View;    ' + #10#13 +
  '                                                          ' + #10#13 +
  'type                                                      ' + #10#13 +
  '  T%FormIdent = class(T%AncestorIdent       )             ' + #10#13 +
  '  private                                                 ' + #10#13 +
  '    { Private declarations }                              ' + #10#13 +
  '  public                                                  ' + #10#13 +
  '    { Public declarations }                               ' + #10#13 +
  '  end;                                                    ' + #10#13 +
  '                                                          ' + #10#13 +
  '                                                          ' + #10#13 +
  '  TView%FormIdent = class(TViewFactory)                   ' + #10#13 +
  '    protected                                             ' + #10#13 +
  '                                                          ' + #10#13 +
  '    public                                                ' + #10#13 +
  '                                                          ' + #10#13 +
  '  end;                                                    ' + #10#13 +
  '                                                          ' + #10#13 +
  'var                                                       ' + #10#13 +
  '  %FormIdent: T%FormIdent;                                ' + #10#13 +
  '                                                          ' + #10#13 +
  'implementation                                            ' + #10#13 +
  '                                                          ' + #10#13 +
  '{$R *.dfm}                                                ' + #10#13 +
  '                                                          ' + #10#13 +
  'end.                                                      ' + #10#13;
