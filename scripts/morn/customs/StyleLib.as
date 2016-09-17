package morn.customs
{
   import morn.customs.expands.StyleConfigVo;
   import morn.core.components.Styles;
   import morn.core.components.Group;
   import morn.core.components.ComboBox;
   import morn.core.components.Button;
   import morn.core.components.CheckBox;
   import morn.core.components.RadioButton;
   import morn.core.components.Label;
   import flash.filters.GlowFilter;
   import flash.filters.DropShadowFilter;
   import morn.customs.expands.SkinConfigVo;
   
   public class StyleLib
   {
      
      public static const L1001_G:String = "渐变1";
      
      public static const L1002_G:String = "渐变2";
      
      public static const L1004_G:String = "渐变灰";
      
      public static const L1005_G:String = "渐变绿";
      
      public static const L1006_G:String = "渐变蓝";
      
      public static const L1007_G:String = "渐变紫";
      
      public static const L1008_G:String = "渐变橙";
      
      public static const L1009_G:String = "渐变红";
      
      public static const L1010_G:String = "渐变黄";
      
      public static const L1012_G:String = "渐变3";
      
      public static const L1013_G:String = "渐变4";
      
      public static const L1021_G:String = "渐变_抽奖";
      
      public static const L1022_G:String = "渐变蓝2";
      
      public static const L1010_TITLE:String = "二级框标题";
      
      public static const L1020_TITLE:String = "加底标题";
      
      public static const L1030_TITLE:String = "升级后加底标题";
      
      public static const L1040_TITLE:String = "技能名标题";
      
      public static const L1050_TITLE:String = "小标题";
      
      public static const L1060_F:String = "战斗渐变";
      
      public static const L2010_CONTENT:String = "普通说明";
      
      public static const L2020_CONTENT:String = "普通绿色";
      
      public static const L2030_CONTENT:String = "不足禁止红";
      
      public static const L2040_CONTENT:String = "下划线黄色";
      
      public static const L2050_CONTENT:String = "普通说明暗色";
      
      public static const L2060_CONTENT:String = "普通灰色";
      
      public static const L3010_ROLE:String = "人名1不随品质变化";
      
      public static const L3012_ROLE:String = "人名2不随品质变化";
      
      public static const L3020_QUALITY:String = "随品质变化";
      
      public static const L4010_IMPORTANT:String = "重要提示黄";
      
      public static const L4020_IMPORTANT:String = "重要提示橘黄";
      
      public static const L4030_IMPORTANT:String = "重要提示绿";
      
      public static const L9010:String = "按钮文字";
      
      public static const L9020:String = "TAB亮";
      
      public static const L9030:String = "TAB暗";
      
      public static const I01_BUTTON_A0:String = "按钮大绿充值";
      
      public static const I01_BUTTON_A1:String = "按钮大黄充值";
      
      public static const I01_BUTTON_A2:String = "按钮大蓝充值";
      
      public static const I01_BUTTON_B1:String = "按钮大红";
      
      public static const I02_BUTTON_B2:String = "按钮大蓝";
      
      public static const I03_BUTTON_B3:String = "按钮大绿";
      
      public static const I04_BUTTON_B4:String = "按钮大黄";
      
      public static const I11_BUTTON_M1:String = "按钮中红";
      
      public static const I12_BUTTON_M2:String = "按钮中蓝";
      
      public static const I13_BUTTON_M3:String = "按钮中绿";
      
      public static const I14_BUTTON_M4:String = "按钮中黄";
      
      public static const I15_BUTTON_M5:String = "按钮中棕";
      
      public static const I21_BUTTON_S1:String = "按钮小红";
      
      public static const I22_BUTTON_S2:String = "按钮小蓝";
      
      public static const I23_BUTTON_S3:String = "按钮小绿";
      
      public static const I24_BUTTON_S4:String = "按钮小黄";
      
      public static const I25_BUTTON_S1:String = "按钮方形绿";
      
      public static const I26_BUTTON_S2:String = "按钮方形蓝";
      
      public static const I31_BUTTON_S1:String = "按钮小红2";
      
      public static const I32_BUTTON_S2:String = "按钮小绿2";
      
      public static const I33_BUTTON_S3:String = "按钮小绿3";
      
      public static const I34_BUTTON_P1:String = "按钮翻页";
      
      public static const I51_CHECKBOX1:String = "CheckBox普通";
      
      public static const I61_RADIO1:String = "Radio普通";
      
      public static const I63_RADIO2:String = "Radio圆形";
      
      public static const I62_COMBOBOX1:String = "Combobox普通";
      
      public static const J21_TAB1:String = "TAB长";
      
      public static const J22_TAB2:String = "TAB短";
      
      public static const J23_TAB3:String = "TAB聊天";
      
      public static const J24_TAB4:String = "TAB暗红色";
      
      public static const J25_TAB5:String = "TAB长倒转";
      
      public static const J26_TAB6:String = "TAB棕色水晶";
      
      public static const J27_TAB7:String = "TAB超长";
      
      public static var comboBoxItemColors:Array = [6198710,16777215,16769187,63753420,0];
      
      private static var _ins:morn.customs.StyleLib;
       
      
      public var lib:Object;
      
      public function StyleLib()
      {
         var _loc2_:* = null;
         lib = {};
         super();
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变1"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBg1";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,5)];
         _loc2_ = new StyleConfigVo().init(14,16769187);
         lib["渐变2"] = new StyleConfigVo().init(14,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.bold = true;
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBg2";
         _loc2_.sizeGrid = "0,0,0,0";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变4"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.bold = true;
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBg3";
         _loc2_.sizeGrid = "0,0,0,0";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变灰"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgGray";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变绿"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgGreen";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变蓝"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgBlue";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变紫"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgPurple";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变橙"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgOrange";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变红"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgRed";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["渐变黄"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgYellow";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(14,16769187);
         lib["渐变3"] = new StyleConfigVo().init(14,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Microsoft YaHei,微软雅黑";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBg2";
         _loc2_.sizeGrid = "0,0,0,0";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         _loc2_ = new StyleConfigVo().init(32,16769187);
         lib["渐变_抽奖"] = new StyleConfigVo().init(32,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.bold = true;
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBg4";
         _loc2_.sizeGrid = "0,0,0,0";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(6697728,1,4,4,5,1),new DropShadowFilter(2,90,0,1,2,2)];
         _loc2_ = new StyleConfigVo().init(32,16769187);
         lib["渐变蓝2"] = new StyleConfigVo().init(32,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.bold = true;
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBgBlue2";
         _loc2_.sizeGrid = "0,0,0,0";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,2,2,4)];
         lib["二级框标题"] = new StyleConfigVo().init(14,16769187);
         lib["加底标题"] = new StyleConfigVo().init(12,15844211).setBold(true);
         lib["升级后加底标题"] = new StyleConfigVo().init(12,16542720).setBold(true);
         lib["技能名标题"] = new StyleConfigVo().init(12,16747076);
         lib["小标题"] = new StyleConfigVo().init(12,15844211);
         _loc2_ = new StyleConfigVo().init(18,16769187);
         lib["战斗渐变"] = new StyleConfigVo().init(18,16769187);
         _loc2_.labelFilterKind = "无";
         _loc2_.font = "Em_YaHeiB";
         _loc2_.skin = "png.a5.bgs.labelBgs.FontBg_fight";
         _loc2_.useTextMask = true;
         _loc2_.filters = [new GlowFilter(0,1,4,4,5)];
         lib["普通说明"] = new StyleConfigVo().init(12,14210735);
         lib["普通绿色"] = new StyleConfigVo().init(12,458496);
         lib["不足禁止红"] = new StyleConfigVo().init(12,16723968);
         lib["下划线黄色"] = new StyleConfigVo().init(12,16773888);
         lib["普通说明暗色"] = new StyleConfigVo().init(12,9532479);
         lib["普通灰色"] = new StyleConfigVo().init(12,7566195);
         lib["人名1不随品质变化"] = new StyleConfigVo().init(12,16769187);
         lib["人名2不随品质变化"] = new StyleConfigVo().init(12,16366967);
         lib["随品质变化"] = new StyleConfigVo().init(12,16769187);
         lib["重要提示黄"] = new StyleConfigVo().init(12,16773888);
         lib["重要提示橘黄"] = new StyleConfigVo().init(12,16542720);
         lib["重要提示绿"] = new StyleConfigVo().init(12,458496);
         lib["按钮文字"] = new StyleConfigVo().init(12,16775367);
         lib["TAB亮"] = new StyleConfigVo().init(12,16769187);
         lib["TAB暗"] = new StyleConfigVo().init(12,11309155);
         var _loc1_:String = "0xf8d38f,0xffe0a3,0xfff8c7";
         lib["按钮大绿充值"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_charge1").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮大黄充值"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_charge2").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮大蓝充值"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_charge").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮大红"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_big_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮大蓝"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_big_S2").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮大绿"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_big_S3").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮大黄"] = new StyleConfigVo("Button").init(13,_loc1_).setSkin("png.a5.btns.btn_big_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮中红"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_middle_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮中蓝"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_middle_S2").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮中绿"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_middle_S3").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮中黄"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_middle_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮中棕"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_middle_S5").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮小红"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮小蓝"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮小绿"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮小黄"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small_S4").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮小绿3"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small_S5").setStateNum(1).setSizeGrid("30,10,30,10");
         lib["按钮小红2"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small2_S1").setStateNum(1).setSizeGrid("22,10,22,10");
         lib["按钮小绿2"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_small2_S2").setStateNum(1).setSizeGrid("22,10,22,10");
         lib["按钮方形绿"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_squareS1").setStateNum(1).setSizeGrid("22,10,22,10");
         lib["按钮方形蓝"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_squareS2").setStateNum(1).setSizeGrid("22,10,22,10");
         lib["按钮翻页"] = new StyleConfigVo("Button").init(12,_loc1_).setSkin("png.a5.btns.btn_page").setStateNum(1).setSizeGrid("22,10,22,10");
         lib["CheckBox普通"] = new StyleConfigVo("CheckBox").init(12,_loc1_).setSkin("png.a5.btns.checkbox_S1").setStateNum(3).set_selectedSkin(new SkinConfigVo("png.a5.commonImgs.勾选框-对勾").set_offsetX(-4).set_offsetY(-4));
         lib["Radio普通"] = new StyleConfigVo("RadioButton").init(12,_loc1_).setSkin("png.a5.btns.radio_S1").setStateNum(3).set_selectedSkin(new SkinConfigVo("png.a5.commonImgs.勾选框-对勾").set_offsetX(-4).set_offsetY(-4));
         lib["Radio圆形"] = new StyleConfigVo("RadioButton").init(12,_loc1_).setSkin("png.a5.btns.radio_S2").setStateNum(3).set_selectedSkin(new SkinConfigVo("png.a5.commonImgs.勾选框-点").set_offsetX(3).set_offsetY(3));
         lib["TAB超长"] = new StyleConfigVo("Tab").init(12,"0xac9063,0xffe0a3,0xffe0a3").setSkin("png.a5.btns.tab_S9").setMargin("0,2,0").setSpace(5);
         lib["TAB长"] = new StyleConfigVo("Tab").init(12,"0xac9063,0xffe0a3,0xffe0a3").setSkin("png.a5.btns.tab_S7").setMargin("0,2,0").setSpace(5);
         lib["TAB长"] = new StyleConfigVo("Tab").init(12,"0xac9063,0xffe0a3,0xffe0a3").setSkin("png.a5.btns.tab_S7").setMargin("0,2,0").setSpace(5);
         lib["TAB短"] = new StyleConfigVo("Tab").init(12,"0xac9063,0xffe0a3,0xffe0a3").setSkin("png.a5.btns.tab_S7").setMargin("0,3,0").setSpace(5);
         lib["TAB聊天"] = new StyleConfigVo("Tab").init(12,"0xce995a,0xfff8c7,0xfff8c7").setSkin("png.a5.btns.tab_S3");
         lib["TAB暗红色"] = new StyleConfigVo("Tab").init(12,"0xce995a,0xfff8c7,0xfff8c7").setSkin("png.a5.btns.tab_S4").setMargin("0,2,0").setSpace(5);
         lib["TAB长倒转"] = new StyleConfigVo("Tab").init(12,"0xac9063,0xffe0a3,0xffe0a3").setSkin("png.a5.btns.tab_S5").setMargin("0,-2,0").setSpace(5);
         lib["TAB棕色水晶"] = new StyleConfigVo("Tab").init(12,"0xce995a,0xfff8c7,0xfff8c7").setSkin("png.a5.btns.tab_S6").setMargin("0,2,0").setSpace(5);
         lib["Combobox普通"] = new StyleConfigVo("ComboBox").init(12,_loc1_).setItemColors(comboBoxItemColors.join(",")).setSkin("png.a5.comps.combobox");
      }
      
      public static function get ins() : morn.customs.StyleLib
      {
         if(_ins == null)
         {
            _ins = new morn.customs.StyleLib();
         }
         return _ins;
      }
      
      public function getStyleGQuality(param1:int) : String
      {
         switch(int(param1) - 2)
         {
            case 0:
               return "渐变绿";
            case 1:
               return "渐变蓝";
            case 2:
               return "渐变紫";
            case 3:
               return "渐变橙";
            case 4:
               return "渐变红";
         }
      }
      
      public function setStyle(param1:*, param2:String) : void
      {
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc7_:* = null;
         if(!param2)
         {
            return;
         }
         var _loc4_:StyleConfigVo = lib[param2];
         if(_loc4_ == null)
         {
            return;
         }
         if(!_loc4_.labelFilterKind)
         {
            _loc4_.labelFilterKind = "黑色1像素描边";
         }
         if(!_loc4_.font)
         {
            _loc4_.font = Styles.fontName;
         }
         if(!_loc4_.stateNum)
         {
            _loc4_.stateNum = 1;
         }
         if(param1 is Group)
         {
            _loc3_ = param1 as Group;
            _loc3_.labelSize = _loc4_.size;
            _loc3_.labelColors = toColorString(_loc4_.color);
            if(_loc4_.bold)
            {
               _loc3_.labelBold = _loc4_.bold;
            }
            _loc3_.labelFilterKind = _loc4_.labelFilterKind;
            if(_loc4_.skin)
            {
               _loc3_.skin = _loc4_.skin;
            }
            if(_loc4_.margin)
            {
               _loc3_.labelMargin = _loc4_.margin;
            }
            if(_loc4_.space)
            {
               _loc3_.space = _loc4_.space;
            }
         }
         else if(param1 is ComboBox)
         {
            _loc6_ = param1 as ComboBox;
            _loc6_.labelFont = _loc4_.font;
            _loc6_.labelSize = _loc4_.size;
            _loc6_.labelColors = toColorString(_loc4_.color);
            _loc6_.itemColors = _loc4_.itemColors;
            if(_loc4_.bold)
            {
               _loc6_.labelBold = _loc4_.bold;
            }
            _loc6_.labelFilterKind = _loc4_.labelFilterKind;
            if(_loc4_.skin)
            {
               _loc6_.skin = _loc4_.skin;
            }
            if(_loc4_.sizeGrid)
            {
               _loc6_.sizeGrid = _loc4_.sizeGrid;
            }
            if(_loc4_.margin)
            {
               _loc6_.labelMargin = _loc4_.margin;
            }
         }
         else if(param1 is Button)
         {
            _loc5_ = param1 as Button;
            _loc5_.stateNum = _loc4_.stateNum;
            _loc5_.labelFont = _loc4_.font;
            _loc5_.labelSize = _loc4_.size;
            _loc5_.labelColors = toColorString(_loc4_.color);
            if(_loc4_.bold)
            {
               _loc5_.labelBold = _loc4_.bold;
            }
            _loc5_.labelFilterKind = _loc4_.labelFilterKind;
            if(_loc4_.skin)
            {
               _loc5_.skin = _loc4_.skin;
            }
            if(_loc4_.sizeGrid)
            {
               _loc5_.sizeGrid = _loc4_.sizeGrid;
            }
            if(_loc4_.margin)
            {
               _loc5_.labelMargin = _loc4_.margin;
            }
            if(param1 is CheckBox)
            {
               (param1 as CheckBox).selectedSkin = _loc4_.selectedSkin;
            }
            if(param1 is RadioButton)
            {
               (param1 as RadioButton).selectedSkin = _loc4_.selectedSkin;
            }
         }
         else if(param1 is Label)
         {
            _loc7_ = param1 as Label;
            _loc7_.font = _loc4_.font;
            _loc7_.size = _loc4_.size;
            _loc7_.color = toColorString(_loc4_.color);
            if(_loc4_.skin)
            {
               _loc7_.skin = _loc4_.skin;
            }
            if(_loc4_.filters)
            {
               _loc7_.filters = _loc4_.filters;
            }
            if(_loc4_.useTextMask)
            {
               _loc7_.useTextMask = true;
            }
            if(_loc4_.bold)
            {
               _loc7_.bold = _loc4_.bold;
            }
            _loc7_.labelFilterKind = _loc4_.labelFilterKind;
            if(_loc4_.sizeGrid)
            {
               _loc7_.sizeGrid = _loc4_.sizeGrid;
            }
            if(_loc4_.margin)
            {
               _loc7_.margin = _loc4_.margin;
            }
            else
            {
               _loc7_.margin = "0,-2,0,0";
            }
         }
      }
      
      private function toColorString(param1:*) : String
      {
         if(param1 is Number)
         {
            return "0x" + (param1 as Number).toString(16);
         }
         return String(param1);
      }
      
      public function getConfigVo(param1:String) : StyleConfigVo
      {
         return this.lib[param1];
      }
   }
}
