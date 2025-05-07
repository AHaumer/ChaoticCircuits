within ChaoticCircuits;
package Components "Components used in the examples"
  extends Modelica.Icons.VariantsPackage;
  annotation (preferredView="info", Documentation(info="<html>
<p>A collection of models (and blocks) used for the different examples.</p>
<h4>Note:</h4>
<p>
Some models (especially ZenerDiodePairApproximation, IdealNIC and Triode) contain a nonlinear algebraic relationship 
between voltage and current which is easy to solve in one direction but hard or impossible in the inverse direction 
due to non-ambigous solutions of the algebraic equation. However, for the use in the examples this has no negative influence. 
</p>
</html>"));
end Components;
