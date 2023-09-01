using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class DescriptionBehaviour : MonoBehaviour
{
    public GameObject DescriptionPanel;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void InitializeDescription(string description)
    {
        var descriptionText = DescriptionPanel.transform.Find("DescriptionText").GetComponent<TextMeshProUGUI>();
        descriptionText.text = description;
    }

    public void ContinueDescription()
    {
        DescriptionPanel.SetActive(false);
    }
}
