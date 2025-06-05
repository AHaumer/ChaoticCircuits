within ChaoticCircuits.Test;
model TestChuasDiode "Test OpAmp-implementation of Chuas diode"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Sources.SineVoltage source(V=12.5, f=10) annotation
    (Placement(transformation(extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Components.IdealChuaDiode idealChuaDiode(redeclare
    ChaoticCircuits.ParameterSets.ChuaData chuaData)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,0})));
  Components.ImprovedChuaDiode improvedChuaDiode(chuaData=idealChuaDiode.chuaData)
    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,0})));
equation
  connect(ground.p, source.n)
    annotation (Line(points={{0,-20},{0,-10}}, color={0,0,255}));
  connect(ground.p, idealChuaDiode.n)
    annotation (Line(points={{0,-20},{-30,-20},{-30,-10}}, color={0,0,255}));
  connect(ground.p, improvedChuaDiode.n)
    annotation (Line(points={{0,-20},{30,-20},{30,-10}}, color={0,0,255}));
  connect(source.p, improvedChuaDiode.p)
    annotation (Line(points={{0,10},{0,20},{30,20},{30,10}}, color={0,0,255}));
  connect(source.p, idealChuaDiode.p) annotation (Line(points={{0,10},{0,20},{-30,
          20},{-30,10}}, color={0,0,255}));
  annotation (experiment(
      StopTime=1.0,
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>Plot idealChuaDiode.i and improvedChuaDiode.i vs. source.v to see the i(v)-characteristic of Chua&#39;s diode, consisting of two NICs (negative impedance converter).</p>
</html>"));
end TestChuasDiode;
