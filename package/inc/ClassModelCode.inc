ClassModelInterf = 'Unit %ModelIdent;              ' + #10#13 +
  ' ///                                                ' + #10#13 +
  ' /// <summary>                                      ' + #10#13 +
  ' ///     Interface de acesso ao Model               ' + #10#13 +
  ' ///     O uso de interface permite diminuir o      ' + #10#13 +
  ' ///     acoplamento entre UNITs                    ' + #10#13 +
  ' /// </summary>                                     ' + #10#13 +
  ' ///                                                ' + #10#13 +
  '                                                              ' + #10#13 +
  'interface                                                     ' + #10#13 +
  '                                                              ' + #10#13 +
  '                                                              ' + #10#13 +
  'Uses MVCBr.Interf,MVCBr.Model;                               ' + #10#13 +
  '                                                              ' + #10#13 +
  'Type                                                          ' + #10#13 +
  '                                                              ' + #10#13 +
  ' ///                                                          ' + #10#13 +
  ' /// Interface para o Model                                   ' + #10#13 +
  ' ///                                                          ' + #10#13 +
  '  I%FormIdentModel = interface(IModel)                        ' + #10#13 +
  '         [''%guid'']                                             ' + #10#13 +
  '    //InterfImplem                                            ' + #10#13 +
  '  end;                                                        ' + #10#13 +
  '                                                              ' + #10#13 +
  'Implementation                                                ' + #10#13 +
  'end.                                                          ' + #10#13;

ClassModelHead = 'unit %ModelIdent;                                   ' + #10#13
  + '                                                              ' + #10#13 +
  ' ///                                                ' + #10#13 +
  ' ///  <summary>                                     ' + #10#13 +
  ' ///     Model para implementar regras de neg�cio   ' + #10#13 +
  ' ///  </summary>                                    ' + #10#13 +
  ' ///                                                ' + #10#13 +
  '//%include                                                    ' + #10#13 +
  'interface                                                     ' + #10#13 +
  '                                                              ' + #10#13 +
  'uses System.SysUtils,{$ifdef FMX} FMX.Forms,{$else} VCL.Forms,{$endif} System.Classes, MVCBr.Interf, MVCBr.Model,     '
  + #10#13 + '     %ClassUnit,                                              ' +
  #10#13 + '     %ModelIdent.interf, MVCBr.Controller;                    ' +
  #10#13 + '                                                              ' +
  #10#13;

ClassModelDef = 'type                                                 ' + #10#13
  + '                                                              ' + #10#13 +
  ' ///                                                          ' + #10#13 +
  ' ///  <summary>                                               ' + #10#13 +
  ' ///     Implementado Objeto Factory para o Model T%FormIdentModel' + #10#13
  + ' ///  </summary>                                              ' + #10#13 +
  ' ///                                                          ' + #10#13 +
  '  T%FormIdentModel = class(TModelFactory,I%FormIdentModel,' +
  '    IThisAs<T%FormIdentModel>)    ' + #10#13 +
  '  protected                                                   ' + #10#13 +
  '     F%ClassModel: %ClassConector;                            ' + #10#13 +
  '  public                                                      ' + #10#13 +
  '    Constructor Create; override;                             ' + #10#13 +
  '    Destructor Destroy; override;                             ' + #10#13 +
  '    function Base:%ClassConector;                         ' + #10#13 +
  '    class function new:I%FormIdentModel;overload;             ' + #10#13 +
  '    class function new(' + #10#13 +
  '      const AController:IController):I%FormIdentModel;overload;' + #10#13 +
  '    function ThisAs:T%FormIdentModel;                         ' + #10#13 +
  '    procedure AfterInit;override;                             ' + #10#13 +
  '    //  Codigo para a ClassModel                              ' + #10#13 +
  '    //InterfImplem                                            ' + #10#13 +
  '  end;                                                        ' + #10#13 +
  '                                                              ' + #10#13;

ClassModelImpl =
  ' ///  Implementa��es                                          ' + #10#13 +
  'Constructor T%FormIdentModel.Create;                ' + #10#13 +
  'begin                                                         ' + #10#13 +
  '  inherited create;                                           ' + #10#13 +
  '  F%ClassModel:= TMVCBr.InvokeCreate<%ClassConector>([nil]);  ' + #10#13 +
  'end;                                                          ' + #10#13 +
  '                                                              ' + #10#13 +
  'function T%FormIdentModel.Base:%ClassConector;              ' + #10#13 +
  'begin                                                         ' + #10#13 +
  '    result := F%ClassModel;                                   ' + #10#13 +
  'end;                                                          ' + #10#13 +
  '                                                              ' + #10#13 +
  'Destructor T%FormIdentModel.Destroy;                          ' + #10#13 +
  'begin                                                         ' + #10#13 +
  '  inherited;                                                  ' + #10#13 +
  'end;                                                          ' + #10#13 +
  '                                                              ' + #10#13 +
  ' ///  ThisAs Retorna o Object Factory do Model (inst�ncia)    ' + #10#13 +
  'function T%FormIdentModel.ThisAs: T%FormIdentModel;           ' + #10#13 +
  'begin                                                         ' + #10#13 +
  '  result := self;                                             ' + #10#13 +
  'end;                                                          ' + #10#13 +
  '                                                              ' + #10#13 +
  ' ///  Criar nova inst�ncia para o Model                      ' + #10#13 +
  'class function T%FormIdentModel.new:I%FormIdentModel;        ' + #10#13 +
  'begin                                                         ' + #10#13 +
  '   result := new(nil);                                        ' + #10#13 +
  'end;                                                          ' + #10#13 +
  '                                                              ' + #10#13 +
  'procedure T%FormIdentModel.AfterInit;                         ' + #10#13 +
  'begin                                                         ' + #10#13 +
  '    // executado apos concluido a carga do controller        ' + #10#13 +
  'end;                                                          ' + #10#13 +
  ' ///  <summary>                                               ' + #10#13 +
  ' ///  New - cria nova inst�ncia para o Model                  ' + #10#13 +
  ' ///  </summary>                                              ' + #10#13 +
  ' ///  <param name="AController">                              ' + #10#13 +
  ' ///     � o controller ao qual o Model esta associado        ' + #10#13 +
  ' ///  </param>                                                ' + #10#13 +
  ' ///  <returns>                                               ' + #10#13 +
  ' ///     retorna a interface                                  ' + #10#13 +
  ' ///  </returns>                                              ' + #10#13 +
  'class function T%FormIdentModel.new(const AController:IController):I%FormIdentModel;'
  + #10#13 + 'begin                                                         ' +
  #10#13 + '  result := T%FormIdentModel.create;                          ' +
  #10#13 + '  result.Controller(AController);                             ' +
  #10#13 + 'end;                                                          ' +
  #10#13 + '                                                      ' + #10#13 +
  '    //InterfCode                                              ' +
  #10#13 + #10#13;

ClassModelCode = ClassModelHead + ClassModelDef +
  '                                                              ' + #10#13 +
  'implementation                                                ' + #10#13 +
  '                                                              ' + #10#13 +
  '                                                              ' + #10#13 +
  ClassModelImpl +
  '                                                              ' + #10#13 +
  'end.                                                          ' + #10#13;

ClassModelCodeFMX = ClassModelCode;
