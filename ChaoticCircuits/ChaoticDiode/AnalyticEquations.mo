within ChaoticCircuits.ChaoticDiode;
model AnalyticEquations "Analytic equations of the chaotic diode circuit"
  extends Modelica.Icons.Example;
  parameter Real a=1/5200 "Parameter a = Ra*Ids/nVt";
  parameter Real b=1.5 "Parameter b = R/Rb";
  parameter Modelica.Units.SI.Time Tau=0.1e-3 "Time constant";
  //shortcut to results
  Real x(start=0.0, fixed=true) "Result x";
  Real y(start=0.1, fixed=true) "Result y";
  Real z(start=0.0, fixed=true) "Result z";
equation
  Tau*der(x)=-y;
  Tau*der(y)=-z;
  Tau*der(z)=-x + a*(exp(y) - 1) - b*z;
  annotation (experiment(
      StopTime=0.1,
      Interval=1e-6,
      Tolerance=1e-06), Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ChaoticDiode\">enclosing subpackage</a>.</p>
</html>"),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="b = 1.5 periodic
b = 1.0 chaotic")}));
end AnalyticEquations;
