% equivstressfunction.m
% Author: John Sanders
% Date modified: 03/18/2020
% Description: Computes the equivalent stress associated with a given
% stress tensor

sigma= [100,120,120;120,100,50;120,50,100];
function [se] = equiv_stress(s)

    % INPUTS:
    %   s = 3x3 matrix representing the stress state
    % OUTPUTS:
    %   se = the associated equivalent stress
    
    % NEVER CLEAR ALL VARIABLES INSIDE A FUNCTION
    % NEVER DEFINE THE INPUTS INSIDE A FUNCTION
    
    % STEP 1: Compute the trace of the stress tensor
    trs = trace(s);

    % STEP 2: Compute the mean stress
    sm = trs/3;

    % STEP 3: Compute the hydrostatic stress
    shyd = sm*eye(3);

    % STEP 4: Compute the deviatoric stress
    sdev = s - shyd;

    % STEP 5: Contract the deviatoric stress with itself
    contract = sum(sum(sdev.*sdev));

    % STEP 6: Evaluate the equivalent stress
    se = sqrt(1.5*contract);

end