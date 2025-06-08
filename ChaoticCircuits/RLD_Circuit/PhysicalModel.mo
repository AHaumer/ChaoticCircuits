within ChaoticCircuits.RLD_Circuit;
model PhysicalModel "RLD-Circuit"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter SI.Resistance R=123 "Resistance of inductor and external";
  parameter SI.Inductance L=10e-3 "Inductor";
  parameter SI.Capacitance C=92e-12 "Fixed capacitance";
  parameter SI.Current Ids=70e-12 "Diode saturation current";
  parameter SI.Voltage nVt=1.4*25e-3 "Diode voltage equivalent of temperature";
  parameter SI.Capacitance C0=33e-12 "Junction capacitance at v=0";
  parameter SI.Voltage V0=0.35 "Junction capacitance parameter";
  parameter Real m=0.45 "Junction capacitance parameter";
  parameter SI.Time TauT=5e-6 "Diode transition time";
  parameter SI.Capacitance Cd=TauT*Ids/nVt "Diffusion capacitance at v=0";
  parameter SI.Frequency f0=1/(2*pi*sqrt(L*(C + C0 + Cd))) "Natural frequency";
  parameter SI.Impedance Z0=sqrt(L/(C + C0)) "Natural impedance";
  parameter Real mu=1 "Relative amplitude of source";
  parameter Real w=1 "Relative frequency of source";
  parameter SI.Voltage V=mu*V0 "Source amplitude";
  parameter SI.Frequency f=w*f0 "Source frequency";
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=V, f=f)
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R)
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(fixed=true), L=L)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(v(fixed=true), C=C)
    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,0})));
  Components.DynamicDiode dynamicDiode(
                               Ids=Ids, nVt=nVt,
    C0=C0,
    V0=V0,
    m=m,
    TauT=TauT)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
equation
  connect(sineVoltage.n, ground.p)
    annotation (Line(points={{-50,-10},{-50,-20}}, color={0,0,255}));
  connect(ground.p, capacitor.n)
    annotation (Line(points={{-50,-20},{40,-20},{40,-10}}, color={0,0,255}));
  connect(ground.p, dynamicDiode.n)
    annotation (Line(points={{-50,-20},{20,-20},{20,-10}}, color={0,0,255}));
  connect(dynamicDiode.p, inductor.n)
    annotation (Line(points={{20,10},{20,20},{10,20}}, color={0,0,255}));
  connect(inductor.n, capacitor.p)
    annotation (Line(points={{10,20},{40,20},{40,10}}, color={0,0,255}));
  connect(inductor.p, resistor.n)
    annotation (Line(points={{-10,20},{-20,20}}, color={0,0,255}));
  connect(sineVoltage.p, resistor.p)
    annotation (Line(points={{-50,10},{-50,20},{-40,20}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=0.001,
      Interval=1e-08,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end PhysicalModel;
