using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuitBehaviour : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnButtonPressed()
    {
        NativeAPI.sendMessageToMobileApp("resetOverview: 0");
        Application.Unload();
    }
}
