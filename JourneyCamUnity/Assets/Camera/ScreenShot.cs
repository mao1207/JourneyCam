using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.Rendering;
using System;
using UnityEngine.UI;

public class NativeAPI
{
    [DllImport("__Internal")]
    public static extern void sendMessageToMobileApp(string message);
}

public class ScreenShot : MonoBehaviour
{
    public string photoString;

    public GameObject Capturing;

    public GameObject AfterCapture;

    public GameObject CapturedImage;

    public GameObject ShotScreen;
    
    private bool takePhoto;

    private bool updatePhoto;

    private void Awake()
    {
        takePhoto = false;
        updatePhoto = false;
        photoString = "";
    }

    private void OnEnable()
    {
        RenderPipelineManager.endCameraRendering += RenderPipelineManager_endCameraRendering;
    }

    private void OnDisable()
    {
        RenderPipelineManager.endCameraRendering -= RenderPipelineManager_endCameraRendering;
    }

    private void RenderPipelineManager_endCameraRendering(ScriptableRenderContext arg1, Camera arg2)
    {
        if (takePhoto)
        {
            takePhoto = false;
            int width = Screen.width;
            int height = Screen.height;

            Texture2D screenshotTexture = new Texture2D(width, height);
            Rect rect = new Rect(0, 0, width, height);
            screenshotTexture.ReadPixels(rect, 0, 0);
            screenshotTexture.Apply();

            byte[] byteArray = screenshotTexture.EncodeToPNG();
            //System.IO.File.WriteAllBytes(Application.dataPath + "/CameraScreenShot.png", byteArray);
            string base64String = Convert.ToBase64String(byteArray);
            photoString = base64String;

            Sprite sprite = Sprite.Create(screenshotTexture, new Rect(0, 0, width, height), Vector2.zero);
            CapturedImage.GetComponent<Image>().sprite = sprite;
            CapturedImage.SetActive(true);
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

    public void CapturePhoto()
    {
        ShotScreen.GetComponent<Animation>().Play();
        takePhoto = true;
        Capturing.SetActive(false);
        AfterCapture.SetActive(true);
    }

    public void ConfirmCapturePhoto()
    {
        NativeAPI.sendMessageToMobileApp("photo:" + photoString);
        Application.Unload();
    }
}
