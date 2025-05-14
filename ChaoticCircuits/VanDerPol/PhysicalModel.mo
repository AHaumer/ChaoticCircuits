within ChaoticCircuits.VanDerPol;
model PhysicalModel "van der Pol equations"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Real mu(unit="1")=0.2 "Damping";
  parameter Real A(unit="1")=1.0 "Amplitude of excitation";
  parameter Real w(unit="1")=1.2 "Rel. frequency of excitation";
  parameter SI.Frequency f=w*w0/(2*pi) "Excitation voltage frequency";
  //initial values
  parameter Real x0(unit="1")=2 "Initial value of x";
  parameter Real y0(unit="1")=-2/15 "Initial value of y";
  parameter Real z0(unit="1")=-5/6 "Initial value of z";
  //assumptions
  parameter SI.AngularVelocity w0=2*pi*1000 "Natural angular velocity";
  parameter SI.Capacitance C=100e-6/(2*pi) "Capacitor";
  //calculated parameters
  parameter SI.Inductance L=1/(w0^2*C) "Inductor";
  parameter SI.Resistance R0=mu*sqrt(L/C) "Nonlinear resistor parameter";
  parameter SI.Current I0=0.5 "Nonlinear resistor parameter";
  parameter SI.Voltage V=A*I0/(w0*C) "Excitation voltage amplitude";
  //shortcut to results
  SI.Current i(start=x0*I0, fixed=true)=triode.i "Current i";
  SI.CurrentSlope didt(start=y0*w0*I0, fixed=true)=der(i) "Current slope der(i)";
  SI.Voltage vc(start=z0*I0/(w0*C), fixed=false)=capacitor.v "Voltage of capactor";
  Real e=excitation.v*w0*C/I0 "Scaled excitation";
  Real x(unit="1")=i/I0 "Scaled current";
  Real y(unit="1")=didt/(w0*I0) "Scaled current slope";
  Real z(unit="1")=vc*w0*C/I0 "Scaled capacitor voltage";
  Modelica.Electrical.Analog.Sources.CosineVoltage excitation(
    V=V,
    phase=-3.1415926535898,
    f=f)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-30,-40},{-10,-20}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,0})));
  ChaoticCircuits.Components.Triode triode(R0=R0, I0=I0)
    annotation (Placement(transformation(extent={{10,-30},{-10,-10}})));
equation
  connect(excitation.n, ground.p)
    annotation (Line(points={{-20,-10},{-20,-20}}, color={0,0,255}));
  connect(inductor.n, capacitor.p)
    annotation (Line(points={{10,20},{20,20},{20,10}}, color={0,0,255}));
  connect(inductor.p, excitation.p)
    annotation (Line(points={{-10,20},{-20,20},{-20,10}}, color={0,0,255}));
  connect(triode.p, capacitor.n)
    annotation (Line(points={{10,-20},{20,-20},{20,-10}}, color={0,0,255}));
  connect(triode.n, ground.p)
    annotation (Line(points={{-10,-20},{-20,-20}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={
                      Text(
          extent={{-80,100},{80,40}},
          textColor={0,0,255},
          textString="A = 0 autononmous
A = 0.45 chaotic
A = 1.00 periodic",
          horizontalAlignment=TextAlignment.Left)}),
    experiment(
      StopTime=0.2,
      Interval=0.2e-05,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.VanDerPol\">enclosing subpackage</a>.</p>
</html>"));
end PhysicalModel;
