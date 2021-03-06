unit TestMVCBrModel;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, System.Classes, System.Generics.collections, MVCBr.Interf,
  MVCBr.Controller,
  MVCBr.Model, System.SysUtils;

type
  // Test methods for class TModelFactory

  TestTModelFactory = class(TTestCase)
  strict private
    FModelFactory: TModelFactory;

  Type
    TTesteController = class(TControllerFactory)
    end;
  protected
    FController : IController;
  public

    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGetController;
    procedure TestGetOwned;
    procedure TestController;
    procedure TestThis;
    procedure TestGetID;
    procedure TestID;
    procedure TestUpdate;
    procedure TestAfterInit;
  end;

implementation

procedure TestTModelFactory.SetUp;
begin
  FController := TTesteController.Create;
  FModelFactory := TModelFactory.Create;
  with FController do
    add(FModelFactory);
end;

procedure TestTModelFactory.TearDown;
begin
  // FModelFactory.Free;
  FModelFactory := nil;
end;

procedure TestTModelFactory.TestGetController;
var
  ReturnValue: IController;
begin
  ReturnValue := FModelFactory.GetController;
  CheckNotNull(ReturnValue, 'Nao retornou');
  CheckTrue(TMVCBr.IsSame(IController, TMVCBr.GetGuid(ReturnValue)));
  // TODO: Validate method results
end;

procedure TestTModelFactory.TestGetOwned;
var
  ReturnValue: TComponent;
begin
  ReturnValue := FModelFactory.GetOwner;
  CheckNotNull(ReturnValue, 'Nao retornou');

  // TODO: Validate method results
end;

procedure TestTModelFactory.TestController;
var
  ReturnValue: IModel;
  AController: IController;
begin
  // TODO: Setup method call parameters
  ReturnValue := FModelFactory.Controller(AController);
  CheckNotNull(ReturnValue, 'Nao retornou');
  // TODO: Validate method results
end;

procedure TestTModelFactory.TestThis;
var
  ReturnValue: TObject;
begin
  ReturnValue := FModelFactory.This;
  CheckNotNull(ReturnValue, 'Nao retornou');
  // TODO: Validate method results
end;

procedure TestTModelFactory.TestGetID;
var
  ReturnValue: string;
begin
  ReturnValue := FModelFactory.GetID;
  CheckTrue(ReturnValue <> '');
  // TODO: Validate method results
end;

procedure TestTModelFactory.TestID;
var
  ReturnValue: IModel;
  AID: string;
begin
  // TODO: Setup method call parameters
  AID := FModelFactory.getID;
  ReturnValue := FModelFactory.ID(AID);
  // TODO: Validate method results
  CheckNotNull(ReturnValue, 'Nao retornou');
end;

procedure TestTModelFactory.TestUpdate;
var
  ReturnValue: IModel;
begin
  ReturnValue := FModelFactory.Update;
  // TODO: Validate method results
  CheckNotNull(ReturnValue, 'Nao retornou');
end;

procedure TestTModelFactory.TestAfterInit;
begin
   FModelFactory.AfterInit;
  // TODO: Validate method results
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTModelFactory.Suite);

end.
