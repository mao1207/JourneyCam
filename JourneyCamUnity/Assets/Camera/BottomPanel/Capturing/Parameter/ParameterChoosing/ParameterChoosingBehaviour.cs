using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParameterChoosingBehaviour : MonoBehaviour
{   
    public GameObject Parameter;
    public GameObject ParameterChoosing;
    public GameObject ParameterSetting;
    public GameObject ParameterAdjusting;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnISOButtonClick()
    {
        OnParameterButtonClick(ParameterType.ISO);
    }

    public void OnFocusDistanceButtonClick()
    {
        OnParameterButtonClick(ParameterType.FocalLength);
    }

    public void OnLightButtonClick()
    {
        OnParameterButtonClick(ParameterType.Aperture);
    }

    public void OnSpeedButtonClick()
    {
        OnParameterButtonClick(ParameterType.ShutterSpeed);
    }

    public void OnBackButtonClick()
    {
        Parameter.SetActive(false);
        ParameterSetting.SetActive(true);
    }

    private void OnParameterButtonClick(ParameterType parameterType)
    {
        ParameterChoosing.SetActive(false);
        InitializeParameterAdjusting(parameterType);
        ParameterAdjusting.SetActive(true);
    }

    private void InitializeParameterAdjusting(ParameterType parameterType)
    {
        ParameterAdjusting.GetComponent<ParameterAdjustingBehaviour>().ParameterType = parameterType;
    }
}
