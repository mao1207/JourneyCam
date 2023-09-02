using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

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

    public VolumeProfile VolumeProfile;

    public WhiteBalance whiteBalance;

    public ColorAdjustments colorAdjustments;

    public MotionBlur motionBlur;

    private readonly int NumberOfTicks = 31;

    public static readonly int[] isoValues = {
        64, 66, 70, 80, 100, 140, 194, 254, 320, 396,
        480, 640, 840, 1080, 1460, 1920, 2560, 3280, 4000, 5100,
        6400, 7800, 9200, 10600, 12300, 14800, 16800, 18800, 20800, 23000,
        25600,
    };

    public static readonly float[] isoRealValues =
    {
        -7, -6.5f, -6f, -5.5f, -5f, -4.5f, -4f, -3.5f, -3f, -2.5f,
        -2f, -1.5f, -1f, -0.5f, -0.3f, 0f, 0.2f, 0.4f, 0.6f, 0.8f,
        1f, 1.2f, 1.4f, 1.6f, 2f, 2.5f, 3f, 3.5f, 4f, 4.5f, 5f
    };

    public static readonly int[] whiteBalances =
    {
        2000, 2200, 2300, 2400, 2500, 2600, 2700, 2800, 2900, 3000,
        3100, 3200, 3300, 3400, 3500, 3600, 3800, 4000, 4200, 4400,
        4600, 4800, 5000, 5200, 5600, 6000, 6400, 6800, 7200, 7600,
        8000
    };

    public static readonly float[] whiteBalanceRealValues =
    {
        -100, -90, -80, -70, -60, -50, -45, -40, -35, -30,
        -25, -20, -15, -10, -5, 0, 5, 10, 15, 20,
        25, 30, 35, 40, 45, 50, 60, 70, 80, 90,
        100
    };

    public static readonly int[] speedValues =
    {
        4000, 3200, 2500, 2000, 1600, 1250, 1000, 800, 640, 500,
        400, 320, 250, 200, 160, 125, 100, 80, 60, 50,
        40, 30, 25, 20, 15, 13, 10, 8, 6, 5, 4
    };

    public static readonly float[] realSpeedValues =
    {
        0f, 0.03f, 0.06f, 0.09f, 0.12f, 0.15f, 0.18f, 0.21f, 0.24f, 0.25f,
        0.27f, 0.3f, 0.33f, 0.36f, 0.39f, 0.42f, 0.45f, 0.48f, 0.51f, 0.54f,
        0.57f, 0.60f, 0.64f, 0.68f, 0.72f, 0.76f, 0.8f, 0.84f, 0.88f, 0.94f, 1f
    };

    public static readonly int[] focalLengthValues =
    {
        6, 7, 8, 9, 10, 12, 14, 16, 18, 20,
        24, 28, 32, 36, 40, 45, 50, 55, 60, 65,
        74, 80, 85, 90, 100, 150, 200, 300, 400, 600,
        800
    };

    private void Awake()
    {
        VolumeProfile.TryGet(out whiteBalance);
        VolumeProfile.TryGet(out colorAdjustments);
        VolumeProfile.TryGet(out motionBlur);
    }

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
                parameterValueText.text = isoValues[getIndex(colorAdjustments.postExposure.value, isoRealValues)].ToString();
                markValues = isoValues;
                for (int i = 0; i < NumberOfTicks; i++)
                {
                    float currentExposureValue = colorAdjustments.postExposure.value;
                    int currentISOValue = isoValues[getIndex(currentExposureValue, isoRealValues)];
                    if (currentISOValue == isoValues[i])
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
                parameterTitleText.text = "白平衡";
                parameterValueText.text = whiteBalances[getIndex(whiteBalance.temperature.value, whiteBalanceRealValues)].ToString();
                markValues = whiteBalances;
                for (int i = 0; i < NumberOfTicks; i++)
                {
                    float currentTemperatureValue = whiteBalance.temperature.value;
                    int currentWhiteBalance = whiteBalances[getIndex(currentTemperatureValue, whiteBalanceRealValues)];
                    if (currentWhiteBalance == whiteBalances[i])
                    {
                        sliderComponent.value = i;
                        break;
                    }
                }
                break;
            case ParameterType.ShutterSpeed:
                parameterTitleText.text = "快门速度";
                parameterValueText.text = speedValues[getIndex(motionBlur.intensity.value, realSpeedValues)].ToString();
                markValues = speedValues;
                for (int i = 0; i < NumberOfTicks; i++)
                {
                    float currentBlurValue = motionBlur.intensity.value;
                    int currentSpeed = speedValues[getIndex(currentBlurValue, realSpeedValues)];
                    if (currentSpeed == speedValues[i])
                    {
                        sliderComponent.value = i;
                        break;
                    }
                }
                break;
        }

        GameObject[] marks = { Mark1, Mark2, Mark3, Mark4 };

        for (int i = 0; i <= 3; i++)
        {
            var markText = marks[i].GetComponent<TextMeshProUGUI>();
            markText.text = markValues[i * 10].ToString();
        }
    }

    public static int getIndex(float element, float[] array)
    {
        for (int i = 0; i < array.Length; i++)
        {
            if (array[i] == element)
            {
                return i;
            }
        }
        return 0;
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
                colorAdjustments.postExposure.value = isoRealValues[currentSliderValue];
                parameterValueText.text = isoValues[currentSliderValue].ToString();
                break;
            case ParameterType.FocalLength:
                physicalCamera.focalLength = focalLengthValues[currentSliderValue];
                parameterValueText.text = physicalCamera.focalLength.ToString();
                break;
            case ParameterType.WhiteBalance:
                whiteBalance.temperature.value = whiteBalanceRealValues[currentSliderValue];
                parameterValueText.text = whiteBalances[currentSliderValue].ToString();
                break;
            case ParameterType.ShutterSpeed:
                motionBlur.intensity.value = realSpeedValues[currentSliderValue];
                parameterValueText.text = speedValues[currentSliderValue].ToString();
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