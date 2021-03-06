unit eMVC.NewProjectWizard;
{ ********************************************************************** }
{ Copyright 2005 Reserved by Eazisoft.com }
{ File Name: NewProjectWizard.pas }
{ Author: Larry Le }
{ Description:  New  eMVC application wizard }
{ }
{ History: }
{ - 1.0, 19 May 2006 }
{ First version }
{ }
{ Email: linfengle@gmail.com }
{ }
{ The contents of this file are subject to the Mozilla Public License }
{ Version 1.1 (the "License"); you may not use this file except in }
{ compliance with the License. You may obtain a copy of the License at }
{ http://www.mozilla.org/MPL/ }
{ }
{ Software distributed under the License is distributed on an "AS IS" }
{ basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See }
{ the License for the specific language governing rights and }
{ limitations under the License. }
{ }
{ The Original Code is written in Delphi. }
{ }
{ The Initial Developer of the Original Code is Larry Le. }
{ Copyright (C) eazisoft.com. All Rights Reserved. }
{ }
{ ********************************************************************** }

interface

{$I .\inc\Compilers.inc} // Compiler Defines
{$R .\inc\ProjectWizards.res} // Wizard Icons

uses
  SysUtils, Windows, Controls,
  eMVC.OTAUtilities,
  eMVC.projectcreator,
  eMVC.ViewCreator,
  eMVC.DataModuleCreator,
  eMVC.FrameCreator,
  eMVC.ControllerCreator,
  eMVC.ModelCreator,
  eMVC.ViewModelCreator,
  eMVC.AppWizardForm,
  eMVC.ProjectGroupCreator,
  eMVC.IncludeCreator,
  Dialogs,
  ToolsApi;

type
  TNewProjectWizard = class(TNotifierObject, IOTAWizard, IOTARepositoryWizard,
    IOTAProjectWizard{$IFDEF MENUDEBUG}, IOTAMenuWizard{$ENDIF})
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: {$IFDEF COMPILER_6_UP}Cardinal{$ELSE}HICON{$ENDIF};
{$IFDEF MENUDEBUG}
    function GetMenuText: string;
{$ENDIF}
  end;

procedure Register;

implementation

uses DCCStrs, System.Classes;
{ TNewProjectWizard }

{$IFDEF MENUDEBUG}

function TNewProjectWizard.GetMenuText: string;
begin
  result := '&Novo projeto MVCBr';
end;
{$ENDIF}
//
// Called when the Wizard is Selected in the ObjectRepository
//

procedure TNewProjectWizard.Execute;
var
  LProjectModule: IOTAModule;
  LOk: Boolean;
  LPath,LPathBase, LAppName: string;
  LProjectCreate: TProjectCreator;
  LProjectIntrf: IOTAProject;
  LViewCreate: TViewCreator;
  LModelCreate: TViewModelCreator;
  LModelInterfCreate: TViewModelCreator;
  LControntrollerCreate: TControllerCreator;
  LInclCreate: TIncludeCreator;
  LIsFMX: Boolean;
  LProjectGroup: IOTAProjectGroup;
  LProjectGroupCreate: TBDSProjectGroupCreator;
  LIdentProject: string;
  LConfigProject: IOTABuildConfiguration;

begin
  // First create the Project
  // ProjectModule :=
  LIdentProject := 'Main';
  with TFormAppWizard.Create(nil) do
  begin
    LOk := showModal = mrOK;
    if not LOk then
    begin
      free;
      exit;
    end
    else
    begin
      LIsFMX := cbFMX.Checked;
      LAppName := edtApp.text;
      if cbUsarNomeProjeto.Checked then
        LIdentProject := stringReplace(LAppName, '.', '', [rfReplaceAll]);
      if pos('.dpr', lowercase(LAppName)) <= 0 then
        LAppName := LAppName + '.dpr';
      debug('AppName: ' + LAppName);
      LPath := trim(edtPath.text);
      LPathBase := trim(edtPath.text);
      if LPath[length(LPath) - 1] <> '\' then
        LPath := LPath + '\';
      free;
    end;
  end;


  try
    LProjectCreate := TProjectCreator.Create;

    LProjectCreate.isFMX := LIsFMX;
    LProjectCreate.FileName := (LPath + LAppName);
    LProjectModule := (BorlandIDEServices as IOTAModuleServices)
      .CreateModule(LProjectCreate);

  except
    on e: Exception do
      debug('Erro (Project): ' + e.message);

  end;

{  if not GetCurrentProjectGroup(LProjectGroup) then
  begin
    raise Exception.Create
      ('Opps, que vergonha - n�o consegui criar um ProjectGroup autom�tico... Necess�rio ter um ProjectGroup criado');
  end
  else
    debug('ProjectGroup Iniciado: ' + LProjectGroup.FileName);
}

  LProjectIntrf := GetActiveProject;
  LConfigProject := (LProjectIntrf.ProjectOptions as IOTAProjectOptionsConfigurations)
    .BaseConfiguration;
  if LIsFMX then
  begin
    LConfigProject.SetValue(sFramework, 'FMX');
    LConfigProject.SetValue(sDefine,'FMX');
  end
  else
  begin
    LConfigProject.SetValue(sFramework, 'VCL');
    LConfigProject.SetValue(sDefine,'VCL');
  end;

  try
    debug('AppWizard: ' + LPath + LAppName);

    LInclCreate := TIncludeCreator.Create(LPath, LIdentProject, false);
    LInclCreate.isFMX := LIsFMX;
    LInclCreate.Templates.addPair('%ModuleIdent', LIdentProject);
    LInclCreate.Templates.addPair('%UnitBase', LAppName);
    (BorlandIDEServices as IOTAModuleServices).CreateModule(LInclCreate);

    LControntrollerCreate := TControllerCreator.Create(LPath, LIdentProject, false, true, true,
      false, false, true);
    debug('Main Controller Creator');
    LControntrollerCreate.Templates.addPair('//ViewModelInit', 'result.add( T' + LIdentProject +
      'ViewModel.new(self));');
    LControntrollerCreate.isFMX := LIsFMX;
    LControntrollerCreate.Templates.addPair('%ModuleIdent', LIdentProject);
    LControntrollerCreate.Templates.addPair('%UnitBase', LAppName);
    (BorlandIDEServices as IOTAModuleServices).CreateModule(LControntrollerCreate);

    LControntrollerCreate := TControllerCreator.Create(LPath, LIdentProject, false, true, true,
      false, false, true);
    debug('Main Controller Creator');
    LControntrollerCreate.Templates.addPair('//ViewModelInit', 'result.add( T' + LIdentProject +
      'ViewModel.new(self));');
    LControntrollerCreate.isFMX := LIsFMX;
    LControntrollerCreate.Templates.addPair('%ModuleIdent', LIdentProject);
    LControntrollerCreate.Templates.addPair('%UnitBase', LAppName);
    LControntrollerCreate.IsInterf := true;
    (BorlandIDEServices as IOTAModuleServices).CreateModule(LControntrollerCreate);

    LModelInterfCreate := TViewModelCreator.Create(LPath, LIdentProject, false);
    LModelInterfCreate.IsInterf := true;
    LModelInterfCreate.isFMX := LIsFMX;
    LModelInterfCreate.Templates.addPair('%ModuleIdent', LIdentProject);
    LModelInterfCreate.Templates.addPair('%UnitBase', LAppName);
    (BorlandIDEServices as IOTAModuleServices).CreateModule(LModelInterfCreate);

    LModelCreate := TViewModelCreator.Create(LPath, LIdentProject, false);
    LModelCreate.isFMX := LIsFMX;
    LModelCreate.Templates.addPair('%MdlInterf', LIdentProject + '.ViewModel.Interf');
    LModelCreate.Templates.addPair('%ModuleIdent', LIdentProject);
    LModelCreate.Templates.addPair('%UnitBase', LAppName);

    (BorlandIDEServices as IOTAModuleServices).CreateModule(LModelCreate);

    // Now create a Form for the Project since the code added to the Project expects it.
    LViewCreate := TViewCreator.Create(LPath, LIdentProject, false);
    LViewCreate.isFMX := LIsFMX;
    LViewCreate.Templates.addPair('%ModuleIdent', LIdentProject);
    LViewCreate.Templates.addPair('%UnitBase', LAppName);
    (BorlandIDEServices as IOTAModuleServices).CreateModule(LViewCreate);

    debug('Path: ' + LPath);

    SetCurrentDir(LPathBase);

  except
    on e: Exception do
      debug(e.message);
  end;
end;

function TNewProjectWizard.GetAuthor: string;
begin
  //
  // When Object Repository is in Detail mode used in the Author column
  //
  result := 'MVCBr'
end;

function TNewProjectWizard.GetComment: string;
begin
  //
  // When Object Repository is in Detail mode used in the Comment column
  //
  result := 'MVCBr Assistente para criar projeto'
end;

function TNewProjectWizard.GetGlyph:
{$IFDEF COMPILER_6_UP}Cardinal{$ELSE}HICON{$ENDIF};
begin
  result := LoadIcon(hInstance, 'SAMPLEWIZARD');
end;

function TNewProjectWizard.GetIDString: string;
begin
  //
  // Unique name for the Wizard used internally by Delphi
  //
  result := 'MVCBr.ProjectCreatorWizard';
end;

function TNewProjectWizard.GetName: string;
begin
  //
  // Name used for user messages and in the Object Repository if
  // implementing a IOTARepositoryWizard object
  //
  result := '1. Projeto MVCBr';
end;

function TNewProjectWizard.GetPage: string;
begin
  result := 'MVCBr'
end;

function TNewProjectWizard.GetState: TWizardState;
begin
  //
  // For Menu Item Wizards only
  //
  result := [wsEnabled];
end;

procedure Register;
begin
  RegisterPackageWizard(TNewProjectWizard.Create);
end;

end.
