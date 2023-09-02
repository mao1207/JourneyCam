using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;

public class EnterBehaviour : MonoBehaviour
{
    public GameObject PracticeTitle;
    public GameObject PracticeDescription;
    public GameObject TopPanel;
    public GameObject BottomPanel;
    public GameObject DescriptionPanel;
    public TextMeshProUGUI DescriptionText;
    public HintBehaviour hintBehaviour;

    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("Start");
    }

    // Update is called once per frame
    void Update()
    {

    }

    void Awake()
    {
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    // called second
    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        Debug.Log("Loaded");
        // Find your player and populate the data like e.g.
        var practiceTypeString = GameObject.Find("SavedType").GetComponent<StartBehaviour>().savedType;
        InitializePractice(practiceTypeString);
    }

    private void OnDestroy()
    {
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    public void InitializePractice(string practiceTypeString)
    { 
        var practiceTitleText = PracticeTitle.GetComponent<TextMeshProUGUI>();
        var practiceDescriptionText = PracticeDescription.gameObject.GetComponent<TextMeshProUGUI>();

        PracticeType practiceType = PracticeType.Design;
        switch (practiceTypeString)
        {
            case "SceneDepth":
                practiceType = PracticeType.SceneDepth;
                break;
            case "DynamicCapture":
                practiceType = PracticeType.DynamicCapture;
                break;
            case "WhiteBalance":
                practiceType = PracticeType.WhiteBalance;
                break;
            case "Exposure":
                practiceType = PracticeType.Exposure;
                break;
            case "Design":
                practiceType = PracticeType.Design;
                break;
        }
        switch (practiceType)
        {
            case PracticeType.SceneDepth:
                practiceTitleText.text = "景深练习";
                practiceDescriptionText.text = "给威廉骑士拍张中景深照（小知识：焦距过小会导致画面变形）";
                DescriptionText.text = "请通过调节<b><color=#A076F9>焦距</color></b>拍摄不同景深的效果";
                hintBehaviour.targetRotation = new Quaternion(0.096f, 0.526f, -0.036f, 0.844f);
                hintBehaviour.targetParameter = ParameterType.FocalLength;
                hintBehaviour.targetParameterValue = 50;
                break;
            case PracticeType.DynamicCapture:
                practiceTitleText.text = "动态捕捉练习";
                practiceDescriptionText.text = "";
                DescriptionText.text = "请通过调节<b><color=#A076F9>快门速度</color></b>捕捉高速移动的车辆";
                //hintBehaviour.targetRotation = new Quaternion(0.096f, 0.526f, -0.036f, 0.844f);
                hintBehaviour.targetParameter = ParameterType.ShutterSpeed;
                //hintBehaviour.targetParameterValue = 50;
                break;
            case PracticeType.WhiteBalance:
                practiceTitleText.text = "白平衡练习";
                practiceDescriptionText.text = "";
                DescriptionText.text = "请通过调节<b><color=#A076F9>白平衡</color></b>拍摄夕阳";
                //hintBehaviour.targetRotation = new Quaternion(0.096f, 0.526f, -0.036f, 0.844f);
                hintBehaviour.targetParameter = ParameterType.WhiteBalance;
                //hintBehaviour.targetParameterValue = 50;
                break;
            case PracticeType.Exposure:
                practiceTitleText.text = "曝光练习";
                practiceDescriptionText.text = "给地球拍张高曝光量照片（小知识：ISO值越大，拍出照片的曝光量越高）";
                DescriptionText.text = "请通过调节<b><color=#A076F9>ISO 感光度</color></b>拍摄不同曝光量的效果";
                hintBehaviour.targetRotation = new Quaternion(0.022f, -0.737f, 0.020f, 0.675f);
                hintBehaviour.targetParameter = ParameterType.ISO;
                hintBehaviour.targetParameterValue = 20800;
                break;
            case PracticeType.Design:
                practiceTitleText.text = "构图练习";
                practiceDescriptionText.text = "用对角线构图法给房间拍张照（小知识：对角线构图能增强房间的空间感）";
                DescriptionText.text = "请通过使用<b><color=#A076F9>对角线构图</color></b>拍摄出房间的空间感";
                hintBehaviour.targetRotation = new Quaternion(0.157f, -0.367f, 0.046f, 0.915f);
                hintBehaviour.targetParameter = ParameterType.None;
                break;
        }
        
        TopPanel.SetActive(true);
        BottomPanel.SetActive(true);
        DescriptionPanel.SetActive(true);
    }

    enum PracticeType
    {
        SceneDepth,
        DynamicCapture,
        WhiteBalance,
        Exposure,
        Design,
    }
}
