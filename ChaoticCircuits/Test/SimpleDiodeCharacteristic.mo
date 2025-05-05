within ChaoticCircuits.Test;
model SimpleDiodeCharacteristic "Characteristic of the simple diode model"
  extends Modelica.Icons.Example;
  SI.Voltage vD(start=0) = diode.v "Diode voltage";
  SI.Current iD=diode.i "Diode current";
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Sources.RampVoltage vSupply(
    V=6,
    duration=1,
    offset=-1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,0})));
  Components.SimpleDiode diode
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Resistor r(R=1000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
equation
  connect(ground.p, vSupply.n)
    annotation (Line(points={{0,-20},{-20,-20},{-20,-10}}, color={0,0,255}));
  connect(vSupply.p, diode.p)
    annotation (Line(points={{-20,10},{-20,20},{-10,20}}, color={0,0,255}));
  connect(diode.n, r.p)
    annotation (Line(points={{10,20},{20,20},{20,10}}, color={0,0,255}));
  connect(ground.p, r.n)
    annotation (Line(points={{0,-20},{20,-20},{20,-10}}, color={0,0,255}));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06), Documentation(info="<html>
<p>Plot diode.i vs. diode.v</p>
</html>"));
end SimpleDiodeCharacteristic;
