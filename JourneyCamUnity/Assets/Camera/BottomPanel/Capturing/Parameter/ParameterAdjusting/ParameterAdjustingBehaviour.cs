using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class ParameterAdjustingBehaviour : MonoBehaviour
{
    public GameObject Camera;

    public GameObject ParameterChoosing;

    public ParameterType ParameterType;

    public GameObject Mark1;

    public GameObject Mark2;

    public GameObject Mark3;

    public GameObject Mark4;

    public HintBehaviour hintBehaviour;

    private readonly int NumberOfTicks = 31;

    private readonly int[] isoValues = {
        64, 66, 70, 80, 100, 140, 194, 254, 320, 396,
        480, 640, 840, 1080, 1460, 1920, 2560, 3280, 4000, 5100, 
        6400, 7800, 9200, 10600, 12300, 14800, 16800, 18800, 20800, 23000,
        25600,
    };

    private readonly int[] focalLengthValues =
    {
        6, 7, 8, 9, 10, 12, 14, 16, 18, 20,
        24, 28, 32, 36, 40, 45, 50, 55, 60, 65,
        74, 80, 85, 90, 100, 150, 200, 300, 400, 600,
        800
    };

    private void OnEnable()
    {
        var parameterTitle = transform.Find("ParameterTitle").gameObject;
        var parameterValue = transform.Find("ParameterValue").gameObject;

        var parameterAdjuster = transform.Find("ParameterAdjuster").gameObject;

        var parameterTitleText = parameterTitle.GetComponent<TextMeshProUGUI>();
        var parameterValueText = parameterValue.GetComponent<TextMeshProUGUI>();

        var physicalCamera = Camera.GetComponent<Camera>();

        var sliderComponent = parameterAdjuster.GetComponent<Slider>();
        sliderComponent.minValue = 0;
        sliderComponent.maxValue = NumberOfTicks - 1;

        int[] markValues = isoValues;

        switch (ParameterType)
        {
            case ParameterType.ISO:
                parameterTitleText.text = "ISO 感光度";
                parameterValueText.text = physicalCamera.iso.ToString();
                markValues = isoValues;
                for (int i = 0; i < NumberOfTicks; i++)
                {
                    int isoValue = isoValues[i];
                    if (physicalCamera.iso == isoValue)
                    {
                        sliderComponent.value = i;
                        break;
                    }
                }
                break;
            case ParameterType.FocalLength:
                parameterTitleText.text = "焦距";
                parameterValueText.text = physicalCamera.focalLength.ToString();
                markValues = focalLengthValues;
                for (int i = 0; i < NumberOfTicks; i++)
                {
                    int focalLengthValue = focalLengthValues[i];
                    if (physicalCamera.focalLength == focalLengthValue)
                    {
                        sliderComponent.value = i;
                        break;
                    }
                }
                break;
            case ParameterType.WhiteBalance:
                parameterTitleText.text = "光圈";
                parameterValueText.text = physicalCamera.aperture.ToString();
                break;
            case ParameterType.ShutterSpeed:
                parameterTitleText.text = "快门";
                break;
        }

        GameObject[] marks = { Mark1, Mark2, Mark3, Mark4 };

        for (int i = 0; i <= 3; i++)
        {
            var markText = marks[i].GetComponent<TextMeshProUGUI>();
            markText.text = markValues[i * 10].ToString();
        }
    }

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnFinishAdjustButtonClick()
    {
        gameObject.SetActive(false);
        ParameterChoosing.SetActive(true);
    }

    public void OnSliderUpdate()
    {
        hintBehaviour.periodTime = 0;

        var parameterValue = transform.Find("ParameterValue").gameObject;
        var parameterAdjuster = transform.Find("ParameterAdjuster").gameObject;

        var sliderComponent = parameterAdjuster.GetComponent<Slider>();
        var parameterValueText = parameterValue.GetComponent<TextMeshProUGUI>();
        var physicalCamera = Camera.GetComponent<Camera>();

        int currentSliderValue = (int)sliderComponent.value;
      
        switch (ParameterType)
        {
            case ParameterType.ISO:
                physicalCamera.iso = isoValues[currentSliderValue];
                parameterValueText.text = physicalCamera.iso.ToString();
                break;
            case ParameterType.FocalLength:
                physicalCamera.focalLength = focalLengthValues[currentSliderValue];
                parameterValueText.text = physicalCamera.focalLength.ToString();
                break;
            case ParameterType.WhiteBalance:
                break;
            case ParameterType.ShutterSpeed:
                break;
        }
    }
}

public enum ParameterType
{
    ISO,
    FocalLength,
    WhiteBalance,
    ShutterSpeed,
    None
}