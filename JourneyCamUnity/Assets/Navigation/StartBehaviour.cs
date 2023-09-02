using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class StartBehaviour : MonoBehaviour
{
    public string savedType;
    // Start is called before the first frame update
    void Awake()
    {
        DontDestroyOnLoad(gameObject);
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void InitializePractice(string practiceTypeString)
    {
        Debug.Log("Initialize");
        savedType = practiceTypeString;
        switch (practiceTypeString)
        {
            case "SceneDepth":
                SceneManager.LoadScene("Environment_Free");
                break;
            case "Exposure":
                SceneManager.LoadScene("Earth");
                break;
            case "Design":
                SceneManager.LoadScene("TheMinmalist_Mian");
                break;
        }
    }
}
