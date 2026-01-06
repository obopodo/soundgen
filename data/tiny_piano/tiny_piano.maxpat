{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 93.0, 977.0, 773.0 ],
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 525.0, 293.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 525.0, 233.0, 104.0, 22.0 ],
					"text" : "expr ($f1 - $f1 / 5)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 459.0, 119.0, 76.0, 20.0 ],
					"text" : "metro period"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"linecount" : 4,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 728.0, 224.0, 150.0, 60.0 ],
					"text" : "I set the record time a bit less than the metro period to be sure that the wav is saved"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 390.0, 314.0, 24.0, 22.0 ],
					"text" : "t 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 390.0, 284.0, 34.0, 22.0 ],
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 168.0, 572.0, 31.0, 22.0 ],
					"text" : "t b s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 348.0, 284.0, 29.5, 22.0 ],
					"text" : "t i i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 153.0, 720.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "bang" ],
					"patching_rect" : [ 349.0, 118.0, 42.0, 22.0 ],
					"text" : "t b b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 349.0, 87.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 168.0, 655.0, 50.0, 35.0 ],
					"text" : "record 990"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 69.0, 601.0, 95.0, 22.0 ],
					"text" : "sprintf record %i"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.831372549019608, 0.282352941176471, 0.23921568627451, 1.0 ],
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 69.0, 573.0, 76.0, 22.0 ],
					"text" : "r recordTime"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.207843137254902, 0.576470588235294, 0.611764705882353, 1.0 ],
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 362.0, 65.0, 22.0 ],
					"text" : "r noteTime"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.831372549019608, 0.282352941176471, 0.23921568627451, 1.0 ],
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 644.0, 262.0, 78.0, 22.0 ],
					"text" : "s recordTime"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.207843137254902, 0.576470588235294, 0.611764705882353, 1.0 ],
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 525.0, 262.0, 67.0, 22.0 ],
					"text" : "s noteTime"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 165.0, 481.0, 152.0, 22.0 ],
					"text" : "sprintf open piano_%s.wav"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 165.0, 516.0, 195.0, 22.0 ],
					"text" : "open ~/Downloads/piano_71.wav"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 242.0, 721.0, 69.0, 22.0 ],
					"text" : "sfrecord~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 644.0, 233.0, 29.5, 22.0 ],
					"text" : "- 10"
				}

			}
, 			{
				"box" : 				{
					"autosave" : 1,
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 8,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "", "list", "int", "", "", "" ],
					"patching_rect" : [ 362.0, 473.0, 300.0, 100.0 ],
					"save" : [ "#N", "vst~", "loaduniqueid", 0, "C74_VST3:/BBC Symphony Orchestra", ";" ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_invisible" : 1,
							"parameter_longname" : "vst~[1]",
							"parameter_modmode" : 0,
							"parameter_shortname" : "vst~[1]",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"parameter_enable" : 1,
						"parameter_mappable" : 0
					}
,
					"snapshot" : 					{
						"filetype" : "C74Snapshot",
						"version" : 2,
						"minorversion" : 0,
						"name" : "snapshotlist",
						"origin" : "vst~",
						"type" : "list",
						"subtype" : "Undefined",
						"embed" : 1,
						"snapshot" : 						{
							"pluginname" : "BBC Symphony Orchestra.vst3info",
							"plugindisplayname" : "BBC Symphony Orchestra",
							"pluginsavedname" : "",
							"pluginsaveduniqueid" : 0,
							"version" : 1,
							"isbank" : 0,
							"isbase64" : 1,
							"sliderorder" : [  ],
							"slidervisibility" : [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
							"blob" : "17262.VMjLgT1P...O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9DiL3XSLtXUSGM1UA4hKtXlKt3hKP4hKt3hKtvjdXQ2bD4hKHMURFkjdP4VPt3hKHYGUmQiQi4BQPITRt3hKtPjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3xc54VUCkzTHgTQC4hK1k2Sy.iQgYFVWkEdMckV0QiUOgFQosjcHIDRqQSLXUWTVoEciY0SnQUQUYDLB4DZ2j1SlYWdTA0ZDUkQqoFUEUDUUQzZ5MUYEQUUNEUURUDMC8TSUQTUAEDZYcFLVokbqc0Sn4RUZcFMwDFZtfVXmAiUYgCRBE0aMICV0k0UYgWPRsjYtTkVmQSLgglKBIFd3XTVvzjQi0DNFk0ZvjFR24RZHYFVWkEdMckV0QiUOgFQosTLyHESn4hPic1XwHFNHIDUuUDagU2cBQ0aEwVX0kjPHMGNFk0aYYkVqEkUOgFQogTcyLzSUsFQHAyZwH1aucUV3fjPLQmXo0zLDMDS4A0PMMCR40DLlkVS3QTZHYFUWoUZ3XTXxUjQhkWUFkENHIDSncCZOcCQpQEUqoGTSQyPOMUUDUEUqo1TGEjTZoFLogjc3.iXzPSLXQENFU0ZvXjX0kjPHESQFEFLUY0SnQTZHU2LC8zTUQTUTslZScTPRokZvjFR1gSQYQCMVg0bqECV4kUUYIGNwf0aQcEYMgiQYsVRBgTLEYTXvTkUOgFVTUES2QDRVUEQS8TSTIEUqUDRRUjZScTUpgTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNvHla3vlX5kTQU0DNFk0ZIIDRwTjQgASUV8DZ5gFSz4RZHU2LC8zTUQTUTslZScTPRokZvjFR1gyZis1cwDVZqYzXzzDUigWVWkEZtf1XmcmUisFLogDSqo1TEUjZTYFVUEES3nGTIEUUVg1Mn8zMLUUTTEUUR4zXDgzaQY0Sn4hLWcWUWgEcQckV4UkUSUWTVkEZtf1XmcmUisFLogDZ2f1S2vTUQQUTUIkSiQDRuEkUOglKxb0bqYDYqkzUPoVVWgEcMYUVpkjPHESQFEFLUY0SnQTZHU2LC8zTUQTUTslZScTPRokZvjFR1gSUg81YWkEdiQTX0kjUXIWRBgTLEYTXvTkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNUE1amcUV3cmdgk1brgjYXcEVxU0UYgCRBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOglKxb0bqYDYqkzQTc1XVkEZtf1XmcmUisFLogDZ2f1S2vTUQQUTUIkSiQDRuEkUOglKxb0YIczXu0jQSUWSwnEZtf1XmcmUisFLogjcHg2R4XWdTUTTEUURznWTlolQYgCRBIVYEwlX5sVLXAUQwj0ZIIDRwTjQgASUV8DZHg2R4XWdTUTTEUURznWTlolQYgCRBIVY2YEV4EkLTs1cVkUZQcUVpEzZh8FLVgEdqcET3E0UZkVRBgTLEYTXvTkUOglKogTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNUE1aQYkVCclUXQGMVkkbIIDRwTjQgASUV8DZtjFR0MyPOMUUDUEUqo1TGEjTZoFLogjc3.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.ka3DiVqkjPHESQFEFLUY0Sn4RZKYGR3sTN1kGUEEUQUkDM5EkYpYTV3fjPhU1cwDVcAcUTzEEaHYFVWgkbUcUV3fjPLQmKogTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNEkEMzXEVysVLXMELwDVcQcjVn4BZic1cVM1ZvjFR1MiPLg1Mn8zMLUUTTEUUR4zXDgzaQY0Sn4hLWUWVWkEdIckVpUULhQENVAkcAcTXzrFQYglKnM1Y2Y0XqASZHg1Mn8zMDoFUTsldPkic4QUQQUTUIQidQYlZFkENHIEVkQiUXMWUrgjYXcEVxU0UYgCRBQ0aEwVX0kDdKkic4QUQQUTUIQidQYlZFkENHIEVkk0UYgWSWoUczvFRlg0UXIWUWkENHIESxPTdMYGVC4zLHg2R4XWdTUTTEUURznWTlolQYgCRRgUYQcUVyEzQgcVTWkURQYDYn4BZic1cVM1ZvjFR1gDdKkic4QUQQUTUIQidQYlZFkENHIEVkkkLg8VSVkESqYUXuEUaHYFVWgkbUcUV3fjTKcGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTXUFNFk0ZMczXn4BZic1cVM1ZvjFRRUkZUUTRqAEZ2f1S2vTUQQUTUIkSiQDRuEkUOgFQwb0YMYzXuk0UYglKnM1Y2Y0XqASZHgGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTXUVRVgUZyYEToE0UZESUrgjYXcEVxU0UYgCRBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFQwb0ZYISXOk0UYg2cVgEMIIDRwTjQgASUV8DZtjFR0MyPOMUUDUEUqo1TGEjTZoFLogzY3TzXxfiQRcFMFk0ZQwFRlg0UXIWUWkENHIDSncCZOcCSUEEUQUkTNMFQH8VTV8DZDEyU0k0UYgWRWokZUEiXTgiUPYWPGEFMqQTVn4BZic1cVM1ZvjFRncCZOcCSUEEUQUkTNMFQH8VTV8DZDEyUtUjQgIWTqI1aiESVqkzUSUWTVkEZtf1XmcmUisFLogzbDkFR0MyPOMUUDUEUqo1TGEjTZoFLogzY3TEVvDkLg0TQwn0ZUUjXn4BZic1cVM1ZvjFR1gDdKkic4QUQQUTUIQidQYlZFkENHIzXkE0UjYWUrgjYXcEVxU0UYgCRBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFTxb0ZzXEVncmUYoVRBgTLEYTXvTkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNEE1YQICVtkjPHESQFEFLUY0Sn4RZHU2LC8zTUQTUTslZScTPRokZvjFR5gCLZs1ZxHlLqYzXocFaHYFVWgkbUcUV3fjPLg1Mn8zMLUUTTEUUR4zXDgzaQY0SnAkLWM2ZFk0aMQjVmQCags1crgjYXcEVxU0UYgCRRwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFTxbULUYTXFkjLgMWRBgTLEYTXvTkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNqM1Z2YTU0kjPHESQFEFLUY0SnQTZLICR3sTN1kGUEEUQUkDM5EkYpYTV3fjPiUVSwfEZtf1XmcmUisFLogTdHkFR0MyPOMUUDUEUqo1TGEjTZoFLogjd3.CVokUUXIWUWkkQIISXykjPHESQFEFLUY0Sn4RZHU2LC8zTUQTUTslZScTPRokZvjFR5gCLXkVVUgkbUcUVTgCaHYFVWgkbUcUV3fjTLgmXogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNvHlcUYUVpkkZhUGLrgjYXcEVxU0UYgCRBwDctjFR0MyPOMUUDUEUqo1TGEjTZoFLogjd3.iX1UkUYoVTvDFZtf1XmcmUisFLogjcyHUSncCZOcCSUEEUQUkTNMFQH8VTV8DZPIyU1kjLg0VRWg0bMQjVmQSLYsVRBgTLEYTXvTkUOglKogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNEM1ZvXjX0kkZhUGLrgjYXcEVxU0UYgCRBwDctjFR0MyPOMUUDUEUqo1TGEjTZoFLogjd3TzXqAiQhUWTvDFZtf1XmcmUisFLogjcyHDSncCZOcCSUEEUQUkTNMFQH8VTV8DZH0lXkE0UZMWUwDFLQ0FRlg0UXIWUWkENHI0R2MiPLg1Mn8zMLUUTTEUUR4zXDgzaQY0SngTahUFMVk0aiYjVngiUigGLToEcIIDRwTjQgASUV8DZHMESncCZOcCSUEEUQUkTNMFQH8VTV8DZH0lXkQiUY81XFoEZ3X0X3ACUXMSRBgTLEYTXvTkUOgFQCwzLHg2R4XWdTUTTEUURznWTlolQYgCRnIFd3T0X4UEaSs1ZwjkaIESXvjTaHYFVWgkbUcUV3fjPLg1Mn8zMLUUTTEUUR4zXDgzaQY0SngTahUVSwDFLzXzXn4BZic1cVM1ZvjFRyQTZHU2LC8zTUQTUTslZScTPRokZvjFR3kjLW8FMwfEZtf1XmcmUisFLogzcHg2R4XWdTUTTEUURznWTlolQYgCRnIFd3TTXms1UYgWSsgjYXcEVxU0UYgCRRwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFRsIVYiYEVuQCaHYFVWgkbUcUV3fjTLQmKogTcyLzSSUEQUQ0ZpM0QAIkVpASZHgWRxbUdQcEV3EUaHYFVWgkbUcUV3fjPLg1Mn8zMLUUTTEUUR4zXDgzaQY0SngTahUVSWQFcMwFRlg0UXIWUWkENHIDSncCZOcCSUEEUQUkTNMFQH8VTV8DZH0lXkEzQgc1ZsgjYXcEVxU0UYgCRRwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFRsIVYyYUVzzjLi8VTxfkaYolX0ACaHYFVWgkbUcUV3fjTKcGR3sTN1kGUEEUQUkDM5EkYpYTV3fDZhgGNvn0ZqIiXxrlQik1YFUUcIIDRwTjQgASUV8DZ5IESncCZOcCSUEEUQUkTNMFQH8VTV8DZH0lXkMmUYQSSxL1aQICVtEELgglKnM1Y2Y0XqASZHMGQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHgWRxb0b3XTVqkjPHESQFEFLUY0Sn4RZHU2LC8zTUQTUTslZScTPRokZvjFR3kjLWMWQFIFZtf1XmcmUisFLogjctHESlgzPHkmKB0jYTMDRw3BdMYlYCgDMtHES14hTLcmKRwDdtHES44hTLomKRwDLtHESw3hTLIiKRwzLtHESz3BZLYmKnwzctfFS34BZLkmKnwjdtfFSv3BZLEiKnwjLtfFSy3BZLQiK3wjctfGS24BdLgmK3wTdtfGS54BdLAiK3wTLtfGSx3BdLMiK3wDMtHTS14hPMcmKB0DdtHTS44hPMomKB0DLtHTSw3hPMIiKB0zLtHTSz3hTMYmKR0zctHUS34hTMkmKR0jdtHUSv3hTMEiKR0jLtHUSy3hTMQiKn0jctfVS24BZMgmKn0TdtfVS54BZMAiKn0TLtfVSx3BZMMiKn0DMtfWS14BdMcmK30DdtfWS44BdMomK30DLtfWSw3BdMIiK30zLtfWSz3hPNYmKB4zctHjS34hPNkmKB4jdtHjSv3hPNEiKB4jLtHjSy3hPNQiKR4jctHkS24hTNgmKR4TdtHkS54hTNAiKR4TLtHkSx3hTNMiKR4DMtHES14xPHcmKSwjYDMDS34hTLYGSCgzctLTSlQzPLAiKRwjcXMDR24RdMYFQCwzLtHES1o1PHcGQCwjYDMES24hTLcGRCgzcDkGSlQzTLomKRwzcTMDR2QTZMYFQSwjLtHES2Y1PHcGQS4jYDkFS14hTLgGQCgzcHkFSlQTZLkmKRwDdPMDR2gzTMYFQowTLtHES3IVZHU2LC8jTIUDUAEUQUUTRqM0TzLzSRkTQTETTEUUQIs1TlgTahUVPWgkdQcUV3QSLRs1ZW8DZ5IESn4BZhgGNEI1YQczXqkTagMUTWgEdQc0Sn4RZHYFRsIVYAcEV5E0UYgGMV8DZHIDR3kjLWYWQFMldUwlXzkUUXI2ZFk0YQckV0QiUOgFR3sTN1k2RRkTQTETTEUUQIs1TSQyPOMUUDUEUqo1TGEjTZoFLogDd3TUXuEkUZMzYVgEczXUVxkjPHESQFEFLUY0Sn4RZHU2LC8zTUQTUTslZScTPRokZvjFR3gSQigWQrEVdAISX4UEaHYFVWgkbUcUV3fjPLg1Mn8zMLUUTTEUUR4zXDgzaQY0SngjLWIWQVQ1ZIcTU3UDagkWPxDVdUwFRlg0UXIWUWkENHIDSncCZOcCSUEEUQUkTNMFQH8VTV8DZpEyUqc1QhgWUwHVdqESXzkjPHESQFEFLUY0SnQTZKYGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTZUVTVQFcEYUXu0TLhglKnM1Y2Y0XqASZHY2LBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOglZwbEdUw1XqkTaXglKnM1Y2Y0XqASZHY2LBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOglZwbEdUYTXqUTLhsVRBgTLEYTXvTkUOglKosDLHg2R4XWdTUTTEUURznWTlolQYgCRRoUYQckVsclQiglKnM1Y2Y0XqASZHY2LR0DZ2f1S2vTUQQUTUIkSiQDRuEkUOglZwbULqwFV3UjQiUWRBgTLEYTXvTkUOgFQosjcHg2R4XWdTUTTEUURznWTlolQYgCRRoUYYcEV3slUXo2ZwDFcIIDRwTjQgASUV8DZtj1R1gDdKkic4QUQQUTUIQidQYlZFkENHgmXkEzUXQWRBgTLEYTXvTkUOglKosDLHg2R4XWdTUTTEUURznWTlolQYgCR3IVYickVpE0QZglKnM1Y2Y0XqASZHY2LR0DZ2f1S2vTUQQUTUIkSiQDRuEkUOgFSxbEa2YkV1kjPHESQFEFLUY0Sn4RZKYGR3sTN1M0TIc1ZOcCSUEEUQUkTNMFQH8VTV8DZ5EyUygCagUWRBgTLEYTXvTkUOglKosjcHIDRysVLXkTTV8DZDkFR0MyPOMUUDUEUqo1TGEjTZoFLogzZ3TUX0QSLgglKnM1Y2Y0XqASZHYGRBgzbqECVIEkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHgFNUEVczDSXn4BZic1cVM1ZvjFR1gjPHM2ZwfURQY0SnQTZHU2LC8zTUQTUTslZScTPRokZvjFRygSQigWUVkEZtf1XmcmUisFLogjcyHDSn4hTg8VSVIkZvjFR3gDdKkic4QUQQUTUIQidQYlZFkENHIUVkEUahsVUrgjYXcEVxU0UYgCRBwDZtHUXu0jURoFLogDdHg2R4XWdTUTTEUURznWTlolQYgCRngUYQ0lXqUEaHYFVWgkbUcUV3fjPLglKRE1aMYkTpASZHgGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTgUFNVMldIIDRwTjQgASUV8DZtj1R1gjPHM2ZwfURQY0SnwTZHU2LC8zTUQTUTslZScTPRokZvjFRqgCLgASTsgjYXcEVxU0UYgCRBwDZtHUXu0jURoFLogTdHg2R4XWdTUTTEUURznWTlolQYgCRngUY3X0X5kjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fDdLg1Mn8zMLUUTTEUUR4zXDgzaQY0SnoWLWcFLrgEZtf1XmcmUisFLogjcyHDSn4hTg8VSVIkZvjFR5gDdKkic4QUQQUTUIQidQYlZFkENHIUVkUjUggVRBgTLEYTXvTkUOglKogjY5YkVosFQYgCRB0DZ2f1S2vTUQQUTUIkSiQDRuEkUOgFRwb0YvvFVn4BZic1cVM1ZvjFR1gjPHM2ZwfURQY0SnAUZHU2LC8zTUQTUTslZScTPRokZvjFRygyZXc1cwfUczXEYn4BZic1cVM1ZvjFR1MiPLglKRE1aMYkTpASZHACR3sTN1kGUEEUQUkDM5EkYpYTV3fjTYUVRVgkbMESXzsVaHYFVWgkbUcUV3fjPLglKRE1aMYkTpASZHACR3sTN1kGUEEUQUkDM5EkYpYTV3fDZXUVRVgkbMESXzsVaHYFVWgkbUcUV3fjPLglKRE1aMYkTpASZHACR3sTN1kGUEEUQUkDM5EkYpYTV3fjTgUVSWokZUEiXn4BZic1cVM1ZvjFR1MiPLglKRE1aMYkTpASZHECR3sTN1kGUEEUQUkDM5EkYpYTV3fjTYUVSWokZUEiXn4BZic1cVM1ZvjFR1gjPHM2ZwfURQY0SngUZHU2LC8zTUQTUTslZScTPRokZvjFRngCLh8VTVkUdIIDRwTjQgASUV8DZtjFRlomUZk1ZDkENHgVSncCZOcCSUEEUQUkTNMFQH8VTV8DZ5EyUmE0UgUWSskEZtf1XmcmUisFLogjcyHDSn4hTg8VSVIkZvjFRxfDdKkic4QUQQUTUIQidQYlZFkENHIUVkUjQiMGNwHFaIIDRwTjQgASUV8DZtjFRlomUZk1ZDkENHgWSncCZOcCSUEEUQUkTNMFQH8VTV8DZHEyUmE0UgUWSskEZtf1XmcmUisFLogjcHIDRysVLXkTTV8DZhkFR0MyPOMUUDUEUqo1TGEjTZoFLogzb3TEV5ASLgkWRsgjYXcEVxU0UYgCRBwDctjFRlomUZk1ZDkENHIjSncCZOcCSUEEUQUkTNMFQH8VTV8DZTEyUmE0UgUWSsIFZtf1XmcmUisFLogjcHIDRysVLXkTTV8DZlkFR0MyPOMUUDUEUqo1TGEjTZoFLogDZ3TEV5ASLgkWRsgjYXcEVxU0UYgCRBwDZtHUXu0jURoFLogzLHg2R4XWdTUTTEUURznWTlolQYgCRREVYvXkVp0TaHYFVWgkbUcUV3fjPLQmKogjY5YkVosFQYgCRR4DZ2f1S2vTUQQUTUIkSiQDRuEkUOgFUwb0bqYTV4kjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fjTNg1Mn8zMLUUTTEUUR4zXDgzaQY0SngTLWM2ZFkUdIIDRwTjQgASUV8DZtjFRlomUZk1ZDkENHIkSncCZOcCSUEEUQUkTNMFQH8VTV8DZ5EyU4E0UYgWUwDFZtf1XmcmUisFLogjcyHDSn4hTg8VSVIkZvjFR24RZHU2LC8zTUQTUTslZScTPRokZvjFRqgCLhoWUrI1Z3vFRlg0UXIWUWkENHIDSn4hTg8VSVIkZvjFR24RZHU2LC8zTUQTUTslZScTPRokZvjFRngCLhoWUrI1Z3vFRlg0UXIWUWkENHIDSn4hTg8VSVIkZvjFR24RZHU2LC8zTUQTUTslZScTPRokZvjFRygSQgsVQFk0ZI0FRlg0UXIWUWkENHIDSz4RZHYldVoUZqQTV3fjTLcGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTYU1cVk0YQYUV3kjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fjTLcGR3sTN1kGUEEUQUkDM5EkYpYTV3fDZXU1cVk0YQYUV3kjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fjTLcGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTgUVSFEVcMcUVn4BZic1cVM1ZvjFR1MiPLglKRE1aMYkTpASZHcGRogTcyLzSSUEQUQ0ZpM0QAIkVpASZHsFNvfkb3DiXqkjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fjTLgGR3sTN1kGUEEUQUkDM5EkYpYTV3fDZXUVSFEVcMcUVn4BZic1cVM1ZvjFR1gjPHM2ZwfURQY0SnQTZLg1Mn8zMLUUTTEUUR4zXDgzaQY0SnoWLWk1cwLlZAcEVzkjPHESQFEFLUY0Sn4RZKYGRBgzbqECVIEkUOgFQ4wDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFUwbUZ2EyXpEzUXQWRBgTLEYTXvTkUOglKogjY5YkVosFQYgCRRwTdHg2R4XWdTUTTEUURznWTlolQYgCRngUYMYTXxDkQhcFMrgjYXcEVxU0UYgCRBwDZtHUXu0jURoFLogzcLkFR0MyPOMUUDUEUqo1TGEjTZoFLogzb3.iX1cmQgkWTsIFZtf1XmcmUisFLogjcyHDSn4hTg8VSVIkZvjFR2AUZHU2LC8zTUQTUTslZScTPRokZvjFRqgCLhY2cFEVdQ0lXn4BZic1cVM1ZvjFR1gjPHM2ZwfURQY0SnQzPMg1Mn8zMLUUTTEUUR4zXDgzaQY0SngTLWkWPGElbMczX3kjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fjTLoGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTgUVSGIlb2EyXzEEaHYFVWgkbUcUV3fjPLQmKogjY5YkVosFQYgCRRwDLHg2R4XWdTUTTEUURznWTlolQYgCRRkUYMcjXxcWLiQWTrgjYXcEVxU0UYgCRBwDZtHUXu0jURoFLogzcTkFR0MyPOMUUDUEUqo1TGEjTZoFLogDZ3.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.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.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbUdQcUV3UULgglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHkGQogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbkbUYEVpUEahglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHgmZogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbUZ2ESX4UEaHYFVWgkbUcUV3fjPLQmKogjYLECV3fDZLoGRBgTZMwVT3giUggCRBwDctjFRlwTLXQENV8DZDk1R1gjPHkVSwPUbUEyX3fjTLQmKogjYLECVFcmUZYGLogjcHg2R4X2PTETRUAUSAIkVpASZHMGNvfkbicTV1UDagglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHkmKogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbUdAcTXx0zQigWRBgTLEYTXvTkUOglKosjcHIDRo0jUOgFSo0DZtfGVokkZhUGLV8DZtj1R1gjPHkVSFUUcvjFR2MiPLglK3gUZMAiVqM1UOgFQosjcHIDRo0DaQI2ZFIFNHIDSncCZOciKUAkTEQ0TlolQYgCRREVYMcjXxcWLiQWTrgjYXcEVxU0UYgCRBwDctjFRlwTLXgCR3wjLHIDRo0DaQgGNVEFNHIDSz4RZHYFSwfEU3X0SnQTZKYGRBgTZMECUwUULigCRRwDctjFRlwTLXYzcVokcvjFR1gDdKkicCQUPIUETMEjTZoFLogzb3.iX1cmQggVRsgjYXcEVxU0UYgCRBwDctjFRlwTLXgCR3wzLHIDRo0DaQgGNVEFNHIDSz4RZHYFSwfEU3X0SnQTZKYGRBgTZMECUwUULigCRRwDctjFRlwTLXYzcVokcvjFR1gDdKkicCQUPIUETMEjTZoFLogzb3.iX1cmQgYWUrIFZtf1XmcmUisFLogjcyHDSn4BdXkFLogTdpkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8DTEoFUAACQH8VTV8DZ5EyU4EzQgIWVFElbIIDRwTjQgASUV8DZtj1R1gjPHkVSV8DZPMDSn4BdXkVVpIVcvX0Sn4RZKYGRBgTZMYTU0ASZHc2LBwDZtfGVo0DLZs1XW8DZDk1R1gjPHkVSrEkbqYjX3fjPLg1Mn8zMtTETRUDUSYlZFkENHIUXkkkQgM2YsIlbIIDRwTjQgASUV8DZtj1R1gjPHkVSV8DZHkFSn4BdXkVVpIVcvX0Sn4RZKYGRBgTZMYTU0ASZHc2LBwDZtfGVo0DLZs1XW8DZDk1R1gjPHkVSrEkbqYjX3fjPLg1Mn8zMtTETRUDUSYlZFkENHIUXkkkQgM2YsoEbIIDRwTjQgASUV8DZtj1R1gjPHkVSV8DZHkGSn4BdXkVVpIVcvX0Sn4RZKYGRBgTZMYTU0ASZHc2LBwDZtfGVo0DLZs1XW8DZDk1R1gjPHkVSrEkbqYjX3fjPLg1Mn8zMtTETRUDUSYlZFkENHIUXkEzUg81YWwDZtf1XmcmUisFLogzcyHDSn4BdXkFLogjdLkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8DTEoFUAACQH8VTV8DZ5EyU1AiUZMSRogjYXcEVxU0UYgCRBwDctjFRlwTLXgCRB0jdHIDRo0DaQgGNVEFNHIDSz4RZHYFSwfEU3X0SnQTZKYGRBgTZMECUwUULigCRRwDctjFRlwTLXYzcVokcvjFR1gDdKkicCQUPIUETMEjTZoFLogzb3TjXtUjUgglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHoGUogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbkcIckVnkjPHESQFEFLUY0Sn4RZKYGRBgTZMY0SnAUZMglK3gUZYolX0AiUOglKosjcHIDRo0jQUUGLogzcyHDSn4BdXkVSvn0Zic0SnQTZKYGRBgTZMwVTxslQhgCRBwDZ2f1S23RUPIUQTMkYpYTV3fjTgUVPWE1aQwFRlg0UXIWUWkENHIDSz4RZHYFSwfENHITSxfjPHkVSrEEd3XUX3fjPLQmKogjYLECVTgiUOgFQosjcHIDRo0TLTEWUwLFNHIESz4RZHYFSwfkQ2YkV1ASZHYGR3sTN1MDUAkTUP0TPRokZvjFRygSQhwVQrIFZtf1XmcmUisFLogjcyHDSn4BdXkFLogjdlkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8DTEoFUAACQH8VTV8DZ5EyU4EzUZI2cVgkb2wFRlg0UXIWUWkENHIDSz4RZHYFSwfENHITSzfjPHkVSrEEd3XUX3fjPLQmKogjYLECVTgiUOgFQosjcHIDRo0TLTEWUwLFNHIESz4RZHYFSwfkQ2YkV1ASZHYGR3sTN1MDUAkTUP0TPRokZvjFRygyZi8VRGMFZtf1XmcmUisFLogzcyHDSn4BdXkFLogzbDkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8TctTETRUDUSUTTUEkTMs1S2bCdTA0ZDUkQqoFUEUDUUQzZ5MUYEQUUNEUURUDMC4hKt3hKt3hKt3hKlIUUMQUTPkzUZESQFM1ZQQEV5UjQtDDQlAEMAcEV40zQtDDQ14hK5EjKt3hKt3hKt3hRUACTEEzZh8VVWgkdUYTTmE0UXwyKIMzasA2atUlaz4COuX0TTMCTrU2Yo41TzEFck4C."
						}
,
						"snapshotlist" : 						{
							"current_snapshot" : 0,
							"entries" : [ 								{
									"filetype" : "C74Snapshot",
									"version" : 2,
									"minorversion" : 0,
									"name" : "BBC Symphony Orchestra",
									"origin" : "BBC Symphony Orchestra.vst3info",
									"type" : "VST3",
									"subtype" : "Instrument",
									"embed" : 0,
									"snapshot" : 									{
										"pluginname" : "BBC Symphony Orchestra.vst3info",
										"plugindisplayname" : "BBC Symphony Orchestra",
										"pluginsavedname" : "",
										"pluginsaveduniqueid" : 0,
										"version" : 1,
										"isbank" : 0,
										"isbase64" : 1,
										"sliderorder" : [  ],
										"slidervisibility" : [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
										"blob" : "17262.VMjLgT1P...O+fWarAhckI2bo8la8HRLt.iHfTlai8FYo41Y8HRUTYTK3HxO9.BOVMEUy.Ea0cVZtMEcgQWY9vSRC8Vav8lak4Fc9DiL3XSLtXUSGM1UA4hKtXlKt3hKP4hKt3hKtvjdXQ2bD4hKHMURFkjdP4VPt3hKHYGUmQiQi4BQPITRt3hKtPjKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3hKt3xc54VUCkzTHgTQC4hK1k2Sy.iQgYFVWkEdMckV0QiUOgFQosjcHIDRqQSLXUWTVoEciY0SnQUQUYDLB4DZ2j1SlYWdTA0ZDUkQqoFUEUDUUQzZ5MUYEQUUNEUURUDMC8TSUQTUAEDZYcFLVokbqc0Sn4RUZcFMwDFZtfVXmAiUYgCRBE0aMICV0k0UYgWPRsjYtTkVmQSLgglKBIFd3XTVvzjQi0DNFk0ZvjFR24RZHYFVWkEdMckV0QiUOgFQosTLyHESn4hPic1XwHFNHIDUuUDagU2cBQ0aEwVX0kjPHMGNFk0aYYkVqEkUOgFQogTcyLzSUsFQHAyZwH1aucUV3fjPLQmXo0zLDMDS4A0PMMCR40DLlkVS3QTZHYFUWoUZ3XTXxUjQhkWUFkENHIDSncCZOcCQpQEUqoGTSQyPOMUUDUEUqo1TGEjTZoFLogjc3.iXzPSLXQENFU0ZvXjX0kjPHESQFEFLUY0SnQTZHU2LC8zTUQTUTslZScTPRokZvjFR1gSQYQCMVg0bqECV4kUUYIGNwf0aQcEYMgiQYsVRBgTLEYTXvTkUOgFVTUES2QDRVUEQS8TSTIEUqUDRRUjZScTUpgTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNvHla3vlX5kTQU0DNFk0ZIIDRwTjQgASUV8DZ5gFSz4RZHU2LC8zTUQTUTslZScTPRokZvjFR1gyZis1cwDVZqYzXzzDUigWVWkEZtf1XmcmUisFLogDSqo1TEUjZTYFVUEES3nGTIEUUVg1Mn8zMLUUTTEUUR4zXDgzaQY0Sn4hLWcWUWgEcQckV4UkUSUWTVkEZtf1XmcmUisFLogDZ2f1S2vTUQQUTUIkSiQDRuEkUOglKxb0bqYDYqkzUPoVVWgEcMYUVpkjPHESQFEFLUY0SnQTZHU2LC8zTUQTUTslZScTPRokZvjFR1gSUg81YWkEdiQTX0kjUXIWRBgTLEYTXvTkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNUE1amcUV3cmdgk1brgjYXcEVxU0UYgCRBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOglKxb0bqYDYqkzQTc1XVkEZtf1XmcmUisFLogDZ2f1S2vTUQQUTUIkSiQDRuEkUOglKxb0YIczXu0jQSUWSwnEZtf1XmcmUisFLogjcHg2R4XWdTUTTEUURznWTlolQYgCRBIVYEwlX5sVLXAUQwj0ZIIDRwTjQgASUV8DZHg2R4XWdTUTTEUURznWTlolQYgCRBIVY2YEV4EkLTs1cVkUZQcUVpEzZh8FLVgEdqcET3E0UZkVRBgTLEYTXvTkUOglKogTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNUE1aQYkVCclUXQGMVkkbIIDRwTjQgASUV8DZtjFR0MyPOMUUDUEUqo1TGEjTZoFLogjc3.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.ka3DiVqkjPHESQFEFLUY0Sn4RZKYGR3sTN1kGUEEUQUkDM5EkYpYTV3fjPhU1cwDVcAcUTzEEaHYFVWgkbUcUV3fjPLQmKogTcyLzSSUEQUQ0ZpM0QAIkVpASZHYGNEkEMzXEVysVLXMELwDVcQcjVn4BZic1cVM1ZvjFR1MiPLg1Mn8zMLUUTTEUUR4zXDgzaQY0Sn4hLWUWVWkEdIckVpUULhQENVAkcAcTXzrFQYglKnM1Y2Y0XqASZHg1Mn8zMDoFUTsldPkic4QUQQUTUIQidQYlZFkENHIEVkQiUXMWUrgjYXcEVxU0UYgCRBQ0aEwVX0kDdKkic4QUQQUTUIQidQYlZFkENHIEVkk0UYgWSWoUczvFRlg0UXIWUWkENHIESxPTdMYGVC4zLHg2R4XWdTUTTEUURznWTlolQYgCRRgUYQcUVyEzQgcVTWkURQYDYn4BZic1cVM1ZvjFR1gDdKkic4QUQQUTUIQidQYlZFkENHIEVkkkLg8VSVkESqYUXuEUaHYFVWgkbUcUV3fjTKcGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTXUFNFk0ZMczXn4BZic1cVM1ZvjFRRUkZUUTRqAEZ2f1S2vTUQQUTUIkSiQDRuEkUOgFQwb0YMYzXuk0UYglKnM1Y2Y0XqASZHgGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTXUVRVgUZyYEToE0UZESUrgjYXcEVxU0UYgCRBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFQwb0ZYISXOk0UYg2cVgEMIIDRwTjQgASUV8DZtjFR0MyPOMUUDUEUqo1TGEjTZoFLogzY3TzXxfiQRcFMFk0ZQwFRlg0UXIWUWkENHIDSncCZOcCSUEEUQUkTNMFQH8VTV8DZDEyU0k0UYgWRWokZUEiXTgiUPYWPGEFMqQTVn4BZic1cVM1ZvjFRncCZOcCSUEEUQUkTNMFQH8VTV8DZDEyUtUjQgIWTqI1aiESVqkzUSUWTVkEZtf1XmcmUisFLogzbDkFR0MyPOMUUDUEUqo1TGEjTZoFLogzY3TEVvDkLg0TQwn0ZUUjXn4BZic1cVM1ZvjFR1gDdKkic4QUQQUTUIQidQYlZFkENHIzXkE0UjYWUrgjYXcEVxU0UYgCRBwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFTxb0ZzXEVncmUYoVRBgTLEYTXvTkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNEE1YQICVtkjPHESQFEFLUY0Sn4RZHU2LC8zTUQTUTslZScTPRokZvjFR5gCLZs1ZxHlLqYzXocFaHYFVWgkbUcUV3fjPLg1Mn8zMLUUTTEUUR4zXDgzaQY0SnAkLWM2ZFk0aMQjVmQCags1crgjYXcEVxU0UYgCRRwDZ2f1S2vTUQQUTUIkSiQDRuEkUOgFTxbULUYTXFkjLgMWRBgTLEYTXvTkUOgFQogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNqM1Z2YTU0kjPHESQFEFLUY0SnQTZLICR3sTN1kGUEEUQUkDM5EkYpYTV3fjPiUVSwfEZtf1XmcmUisFLogTdHkFR0MyPOMUUDUEUqo1TGEjTZoFLogjd3.CVokUUXIWUWkkQIISXykjPHESQFEFLUY0Sn4RZHU2LC8zTUQTUTslZScTPRokZvjFR5gCLXkVVUgkbUcUVTgCaHYFVWgkbUcUV3fjTLgmXogTcyLzSSUEQUQ0ZpM0QAIkVpASZHoGNvHlcUYUVpkkZhUGLrgjYXcEVxU0UYgCRBwDctjFR0MyPOMUUDUEUqo1TGEjTZoFLogjd3.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.iX1cmQgkWTsIFZtf1XmcmUisFLogjcyHDSn4hTg8VSVIkZvjFR2AUZHU2LC8zTUQTUTslZScTPRokZvjFRqgCLhY2cFEVdQ0lXn4BZic1cVM1ZvjFR1gjPHM2ZwfURQY0SnQzPMg1Mn8zMLUUTTEUUR4zXDgzaQY0SngTLWkWPGElbMczX3kjPHESQFEFLUY0Sn4RZHYldVoUZqQTV3fjTLoGR3sTN1kGUEEUQUkDM5EkYpYTV3fjTgUVSGIlb2EyXzEEaHYFVWgkbUcUV3fjPLQmKogjY5YkVosFQYgCRRwDLHg2R4XWdTUTTEUURznWTlolQYgCRRkUYMcjXxcWLiQWTrgjYXcEVxU0UYgCRBwDZtHUXu0jURoFLogzcTkFR0MyPOMUUDUEUqo1TGEjTZoFLogDZ3.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.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.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbUdQcUV3UULgglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHkGQogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbkbUYEVpUEahglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHgmZogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbUZ2ESX4UEaHYFVWgkbUcUV3fjPLQmKogjYLECV3fDZLoGRBgTZMwVT3giUggCRBwDctjFRlwTLXQENV8DZDk1R1gjPHkVSwPUbUEyX3fjTLQmKogjYLECVFcmUZYGLogjcHg2R4X2PTETRUAUSAIkVpASZHMGNvfkbicTV1UDagglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHkmKogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbUdAcTXx0zQigWRBgTLEYTXvTkUOglKosjcHIDRo0jUOgFSo0DZtfGVokkZhUGLV8DZtj1R1gjPHkVSFUUcvjFR2MiPLglK3gUZMAiVqM1UOgFQosjcHIDRo0DaQI2ZFIFNHIDSncCZOciKUAkTEQ0TlolQYgCRREVYMcjXxcWLiQWTrgjYXcEVxU0UYgCRBwDctjFRlwTLXgCR3wjLHIDRo0DaQgGNVEFNHIDSz4RZHYFSwfEU3X0SnQTZKYGRBgTZMECUwUULigCRRwDctjFRlwTLXYzcVokcvjFR1gDdKkicCQUPIUETMEjTZoFLogzb3.iX1cmQggVRsgjYXcEVxU0UYgCRBwDctjFRlwTLXgCR3wzLHIDRo0DaQgGNVEFNHIDSz4RZHYFSwfEU3X0SnQTZKYGRBgTZMECUwUULigCRRwDctjFRlwTLXYzcVokcvjFR1gDdKkicCQUPIUETMEjTZoFLogzb3.iX1cmQgYWUrIFZtf1XmcmUisFLogjcyHDSn4BdXkFLogTdpkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8DTEoFUAACQH8VTV8DZ5EyU4EzQgIWVFElbIIDRwTjQgASUV8DZtj1R1gjPHkVSV8DZPMDSn4BdXkVVpIVcvX0Sn4RZKYGRBgTZMYTU0ASZHc2LBwDZtfGVo0DLZs1XW8DZDk1R1gjPHkVSrEkbqYjX3fjPLg1Mn8zMtTETRUDUSYlZFkENHIUXkkkQgM2YsIlbIIDRwTjQgASUV8DZtj1R1gjPHkVSV8DZHkFSn4BdXkVVpIVcvX0Sn4RZKYGRBgTZMYTU0ASZHc2LBwDZtfGVo0DLZs1XW8DZDk1R1gjPHkVSrEkbqYjX3fjPLg1Mn8zMtTETRUDUSYlZFkENHIUXkkkQgM2YsoEbIIDRwTjQgASUV8DZtj1R1gjPHkVSV8DZHkGSn4BdXkVVpIVcvX0Sn4RZKYGRBgTZMYTU0ASZHc2LBwDZtfGVo0DLZs1XW8DZDk1R1gjPHkVSrEkbqYjX3fjPLg1Mn8zMtTETRUDUSYlZFkENHIUXkEzUg81YWwDZtf1XmcmUisFLogzcyHDSn4BdXkFLogjdLkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8DTEoFUAACQH8VTV8DZ5EyU1AiUZMSRogjYXcEVxU0UYgCRBwDctjFRlwTLXgCRB0jdHIDRo0DaQgGNVEFNHIDSz4RZHYFSwfEU3X0SnQTZKYGRBgTZMECUwUULigCRRwDctjFRlwTLXYzcVokcvjFR1gDdKkicCQUPIUETMEjTZoFLogzb3TjXtUjUgglKnM1Y2Y0XqASZHY2LBwDZtfGVoASZHoGUogjYLECVFkjLgMGLogjcyHDSn4BdXkVTvDFNHIESz4RZHYFSwf0TyYUVx.SZHc2LBwDZtfGVokEQg8VPW8DZtjFR0MyPOAUQpQUPvPDRuEkUOgldwbkcIckVnkjPHESQFEFLUY0Sn4RZKYGRBgTZMY0SnAUZMglK3gUZYolX0AiUOglKosjcHIDRo0jQUUGLogzcyHDSn4BdXkVSvn0Zic0SnQTZKYGRBgTZMwVTxslQhgCRBwDZ2f1S23RUPIUQTMkYpYTV3fjTgUVPWE1aQwFRlg0UXIWUWkENHIDSz4RZHYFSwfENHITSxfjPHkVSrEEd3XUX3fjPLQmKogjYLECVTgiUOgFQosjcHIDRo0TLTEWUwLFNHIESz4RZHYFSwfkQ2YkV1ASZHYGR3sTN1MDUAkTUP0TPRokZvjFRygSQhwVQrIFZtf1XmcmUisFLogjcyHDSn4BdXkFLogjdlkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8DTEoFUAACQH8VTV8DZ5EyU4EzUZI2cVgkb2wFRlg0UXIWUWkENHIDSz4RZHYFSwfENHITSzfjPHkVSrEEd3XUX3fjPLQmKogjYLECVTgiUOgFQosjcHIDRo0TLTEWUwLFNHIESz4RZHYFSwfkQ2YkV1ASZHYGR3sTN1MDUAkTUP0TPRokZvjFRygyZi8VRGMFZtf1XmcmUisFLogzcyHDSn4BdXkFLogzbDkFRlwTLXYTRxD1bvjFR1MiPLglK3gUZQASX3fjTLQmKogjYLECVSMmUYICLogzcyHDSn4BdXkVVDE1aAc0Sn4RZHU2LC8TctTETRUDUSUTTUEkTMs1S2bCdTA0ZDUkQqoFUEUDUUQzZ5MUYEQUUNEUURUDMC4hKt3hKt3hKt3hKlIUUMQUTPkzUZESQFM1ZQQEV5UjQtDDQlAEMAcEV40zQtDDQ14hK5EjKt3hKt3hKt3hRUACTEEzZh8VVWgkdUYTTmE0UXwyKIMzasA2atUlaz4COuX0TTMCTrU2Yo41TzEFck4C."
									}
,
									"fileref" : 									{
										"name" : "BBC Symphony Orchestra",
										"filename" : "BBC Symphony Orchestra.maxsnap",
										"filepath" : "~/Documents/Max 9/Snapshots",
										"filepos" : -1,
										"snapshotfileid" : "bb0c55fd7fe0e2fe2f858fd7f2bc38e7"
									}

								}
 ]
						}

					}
,
					"text" : "vst~ \"C74_VST3:/BBC Symphony Orchestra\"",
					"varname" : "vst~[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 362.0, 620.5, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 7,
					"numoutlets" : 2,
					"outlettype" : [ "int", "" ],
					"patching_rect" : [ 362.0, 442.0, 82.0, 22.0 ],
					"text" : "midiformat"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 362.0, 416.0, 29.5, 22.0 ],
					"text" : "join"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 281.0, 284.0, 50.0, 22.0 ],
					"text" : "71"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 413.0, 118.0, 35.0, 22.0 ],
					"text" : "1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 362.0, 390.0, 78.0, 22.0 ],
					"text" : "makenote 60"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 348.0, 254.0, 82.0, 22.0 ],
					"text" : "counter 48 71"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 349.0, 164.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 349.0, 216.0, 39.0, 22.0 ],
					"text" : "metro"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-16", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 1 ],
					"source" : [ "obj-20", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"order" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"order" : 1,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 1 ],
					"order" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"order" : 1,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 1 ],
					"order" : 1,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"order" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 1 ],
					"source" : [ "obj-6", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 2 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 1 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"order" : 0,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"order" : 1,
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 2 ],
					"source" : [ "obj-70", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-70", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-81", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-82", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"midpoints" : [ 399.5, 339.0, 435.28515625, 339.0, 435.28515625, 159.0, 358.5, 159.0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 1,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 1 ],
					"order" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 1 ],
					"order" : 2,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"order" : 1,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-20" : [ "vst~[1]", "vst~[1]", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "BBC Symphony Orchestra.maxsnap",
				"bootpath" : "~/Documents/Max 9/Snapshots",
				"patcherrelativepath" : "../../../../Max 9/Snapshots",
				"type" : "mx@s",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"toolbaradditions" : [ "packagemanager", "ABL Effect Modules" ]
	}

}
