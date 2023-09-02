using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class HintBehaviour : MonoBehaviour
{
    public Camera PhysicalCamera;

    public ParameterType targetParameter;

    public float targetParameterValue;

    public GameObject VerticalHint;

    public GameObject HorizontalHint;

    public GameObject ObliqueHint;

    public GameObject DoneHint;

    public GameObject ParameterSettingActivated;

    public GameObject ParameterSetting;

    public GameObject ParameterChoosing;

    public GameObject ParameterAdjusting;

    public GameObject FocalLengthActivated;

    public GameObject ISOActivated;

    public GameObject WhiteBalanceActivated;

    public GameObject SpeedActivated;

    public GameObject SmallerHint;

    public GameObject HigherHint;

    private Sprite[] smallerResources;

    private Sprite[] higherResources;

    public float periodTime;

    public float targetPeriodTime;

    public float totalTime;

    public Quaternion targetRotation;

    public bool findRightPosition;

    public bool findRightParameter;

    private int smallerIndex;

    private int higherIndex;

    public GameObject CapturedImage;

    public GameObject DescriptionPanel;

    public VolumeProfile VolumeProfile;

    public WhiteBalance whiteBalance;

    public ColorAdjustments colorAdjustments;

    public MotionBlur motionBlur;

    private void Awake()
    {
        VolumeProfile.TryGet(out whiteBalance);
        VolumeProfile.TryGet(out colorAdjustments);
        VolumeProfile.TryGet(out motionBlur);
    }

    // Start is called before the first frame update
    void Start()
    {
        periodTime = 0;
        targetPeriodTime = 2.5f;
        Sprite[] tempSmallerResources = { Resources.Load<Sprite>("smaller1"), Resources.Load<Sprite>("smaller2"), Resources.Load<Sprite>("smaller3") };
        smallerResources = tempSmallerResources;
        Sprite[] tempHigherResources = { Resources.Load<Sprite>("higher1"), Resources.Load<Sprite>("higher2"), Resources.Load<Sprite>("higher3") };
        higherResources = tempHigherResources;
        smallerIndex = 0;
        higherIndex = 0;
    }

    // Update is called once per frame
    void Update()
    {
        periodTime += Time.deltaTime;
        totalTime += Time.deltaTime;

        float currentParameterValue = 0;
        switch (targetParameter)
        {
            case ParameterType.ISO:
                currentParameterValue = ParameterAdjustingBehaviour.isoValues[ParameterAdjustingBehaviour.getIndex(colorAdjustments.postExposure.value, ParameterAdjustingBehaviour.isoRealValues)];
                break;
            case ParameterType.FocalLength:
                currentParameterValue = PhysicalCamera.focalLength;
                break;
            case ParameterType.WhiteBalance:
                currentParameterValue = ParameterAdjustingBehaviour.whiteBalances[ParameterAdjustingBehaviour.getIndex(whiteBalance.temperature.value, ParameterAdjustingBehaviour.whiteBalanceRealValues)];
                break;
            case ParameterType.ShutterSpeed:
                currentParameterValue = ParameterAdjustingBehaviour.speedValues[ParameterAdjustingBehaviour.getIndex(motionBlur.intensity.value, ParameterAdjustingBehaviour.realSpeedValues)];
                break;
        }

        if (periodTime > targetPeriodTime && !CapturedImage.activeSelf && !DescriptionPanel.activeSelf)
        {
            periodTime = 0;

            var currentRotation = PhysicalCamera.transform.rotation;
            var relativeRotation = Quaternion.Inverse(currentRotation) * targetRotation;

            Vector3 axis;
            float angle;
            relativeRotation.ToAngleAxis(out angle, out axis);

            HintDirection hintDirection = HintDirection.None;
            var hintResource = Resources.Load<Sprite>("PerfectPosition");

            if (angle > 20)
            {
                if (axis.x > 0.5 && axis.y > 0.5)
                {
                    hintDirection = HintDirection.LowerRight;
                    hintResource = Resources.Load<Sprite>("MoveLowerRight");
                }
                else if (axis.x > 0.5 && axis.y < -0.5)
                {
                    hintDirection = HintDirection.LowerLeft;
                    hintResource = Resources.Load<Sprite>("MoveLowerLeft");
                }
                else if (axis.x < -0.5 && axis.y > 0.5)
                {
                    hintDirection = HintDirection.UpperRight;
                    hintResource = Resources.Load<Sprite>("MoveUpperRight");
                }
                else if (axis.x < -0.5 && axis.y > 0.5)
                {
                    hintDirection = HintDirection.UpperLeft;
                    hintResource = Resources.Load<Sprite>("MoveUpperLeft");
                }
                else if (axis.x > 0.5)
                {
                    hintDirection = HintDirection.Low;
                    hintResource = Resources.Load<Sprite>("MoveDown");
                }
                else if (axis.x < -0.5)
                {
                    hintDirection = HintDirection.Up;
                    hintResource = Resources.Load<Sprite>("MoveUp");
                }
                else if (axis.y > 0.5)
                {
                    hintDirection = HintDirection.Right;
                    hintResource = Resources.Load<Sprite>("MoveRight");
                }
                else if (axis.y < -0.5)
                {
                    hintDirection = HintDirection.Left;
                    hintResource = Resources.Load<Sprite>("MoveLeft");
                }
            }

            if (hintDirection != HintDirection.None)
            {
                targetPeriodTime = 2.5f;
                if (hintDirection == HintDirection.Left || hintDirection == HintDirection.Right)
                {
                    HorizontalHint.GetComponent<Image>().sprite = hintResource;
                    HorizontalHint.GetComponent<Animation>().Play();
                }
                else if (hintDirection == HintDirection.Up || hintDirection == HintDirection.Low)
                {
                    VerticalHint.GetComponent<Image>().sprite = hintResource;
                    VerticalHint.GetComponent<Animation>().Play();
                }
                else if (hintDirection == HintDirection.LowerLeft || hintDirection == HintDirection.LowerRight
                  || hintDirection == HintDirection.UpperLeft || hintDirection == HintDirection.UpperRight)
                {
                    ObliqueHint.GetComponent<Image>().sprite = hintResource;
                    ObliqueHint.GetComponent<Animation>().Play();
                }
                findRightPosition = false;
                findRightParameter = false;
            }
            else if (!findRightPosition)
            {
                targetPeriodTime = 2.5f;
                DoneHint.GetComponent<Image>().sprite = hintResource;
                findRightPosition = true;
                DoneHint.GetComponent<Animation>().Play();
            }
            else
            {
                if (targetParameter != ParameterType.None) {
                    if (targetParameterValue == currentParameterValue)
                    {
                        if (!findRightParameter)
                        {
                            targetPeriodTime = 2.5f;
                            DoneHint.GetComponent<Image>().sprite = Resources.Load<Sprite>("PerfectParameter");
                            findRightParameter = true;
                            var oldFocalLengthActivatedColor = FocalLengthActivated.GetComponent<Image>().color;
                            FocalLengthActivated.GetComponent<Image>().color = new Color(oldFocalLengthActivatedColor.r, oldFocalLengthActivatedColor.g, oldFocalLengthActivatedColor.b, oldFocalLengthActivatedColor.a);
                            var oldParameterSettingActivatedColor = ParameterSettingActivated.GetComponent<Image>().color;
                            FocalLengthActivated.GetComponent<Image>().color = new Color(oldParameterSettingActivatedColor.r, oldParameterSettingActivatedColor.g, oldParameterSettingActivatedColor.b, oldFocalLengthActivatedColor.a);
                            DoneHint.GetComponent<Animation>().Play();
                        }
                    }
                    else
                    {
                        findRightParameter = false;
                        targetPeriodTime = 1.0f;
                        if (ParameterSetting.activeSelf)
                        {
                            targetPeriodTime = 1.5f;
                            ParameterSettingActivated.GetComponent<Animation>().Play();
                        }
                        else if (ParameterChoosing.activeSelf)
                        {
                            targetPeriodTime = 1.5f;
                            switch (targetParameter)
                            {
                                case ParameterType.ISO:
                                    ISOActivated.GetComponent<Animation>().Play();
                                    break;
                                case ParameterType.FocalLength:
                                    FocalLengthActivated.GetComponent<Animation>().Play();
                                    break;
                                case ParameterType.WhiteBalance:
                                    WhiteBalanceActivated.GetComponent<Animation>().Play();
                                    break;
                                case ParameterType.ShutterSpeed:
                                    SpeedActivated.GetComponent<Animation>().Play();
                                    break;
                            }
                        }
                    }
                }
            }
        }
        if (ParameterAdjusting.activeSelf)
        {
            var smallerImage = SmallerHint.GetComponent<Image>();
            var higherImage = HigherHint.GetComponent<Image>();
            if (totalTime >= 0.3)
            {
                totalTime = 0;
                if (currentParameterValue > targetParameterValue)
                {
                    higherImage.color = new Color(1, 1, 1, 0);
                    smallerImage.color = new Color(1, 1, 1, 1);
                    smallerImage.sprite = smallerResources[smallerIndex];
                    smallerIndex = (smallerIndex + 1) % 3;
                }
                else if (currentParameterValue < targetParameterValue)
                {
                    smallerImage.color = new Color(1, 1, 1, 0);
                    higherImage.color = new Color(1, 1, 1, 1);
                    higherImage.sprite = higherResources[higherIndex];
                    higherIndex = (higherIndex + 1) % 3;
                }
            }
            if (currentParameterValue == targetParameterValue)
            {
                smallerImage.color = new Color(1, 1, 1, 0);
                higherImage.color = new Color(1, 1, 1, 0);
            }
        }
    }

}

enum HintDirection
{
    Left,
    Right,
    Up,
    Low,
    UpperLeft,
    UpperRight,
    LowerLeft,
    LowerRight,
    None
}
