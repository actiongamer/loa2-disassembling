package nslm2.utils
{
   import com.mz.core.interFace.ILabelMed;
   import nslm2.common.vo.VipInfoVo;
   import flash.text.TextField;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.localeModules.LocaleParseVo;
   import nslm2.common.ui.components.comps2d.icons.labels.WealthRenderLabelS0;
   import morn.customs.components.WealthRender;
   import nslm2.common.ui.components.comps2d.icons.labels.WealthRenderLabelS1;
   import morn.core.components.Component;
   import morn.core.components.Image;
   import nslm2.common.ui.components.comps2d.externals.qqs.QQVipImage;
   import nslm2.mgrs.skins.SkinLib;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import morn.core.utils.StringUtils;
   import com.mz.core.interFace.IDispose;
   
   public class LabelMed implements ILabelMed
   {
      
      public static const KEY_vipIcon:String = "vipIcon";
       
      
      private var tf:TextField;
      
      public function LabelMed()
      {
         tf = new TextField();
         super();
      }
      
      public static function wealthParam(param1:int, param2:int, param3:int, param4:int = 0) : String
      {
         return "@{wealth:" + param1 + ":" + param2 + ":" + param3 + "|style:" + param4 + "}";
      }
      
      public static function vipParam(param1:VipInfoVo) : String
      {
         if(param1 && param1.curQQVip > 0)
         {
            return "@{vipIcon:" + param1.curQQVip + ":" + (!!param1.isQQYear?1:0) + ":" + (!!param1.isQQLux?1:0) + "}";
         }
         return "";
      }
      
      public function parseText(param1:Label, param2:String) : void
      {
         var _loc10_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc14_:* = null;
         var _loc12_:* = null;
         var _loc13_:RegExp = new RegExp(/@{.*?}/g);
         var _loc11_:Array = param2.match(LocaleMgr.reg);
         var _loc9_:int = _loc11_.length;
         if(param1.labelMedItemList)
         {
            RTools.disposeArrOrVector(param1.labelMedItemList);
         }
         if(_loc9_ > 0)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc3_ = new LocaleParseVo(_loc11_[_loc10_]);
               var _loc15_:* = _loc3_.key;
               if("wealth" !== _loc15_)
               {
                  if("icon" !== _loc15_)
                  {
                     if("vipIcon" === _loc15_)
                     {
                        if(_loc3_.paramArr[0] > 0)
                        {
                           _loc7_ = new QQVipImage(SkinLib.vipIconPic(_loc3_.paramArr[0],int(_loc3_.paramArr[1]),int(_loc3_.paramArr[2])));
                        }
                     }
                  }
                  else
                  {
                     _loc5_ = new Image(_loc3_.paramArr[0]);
                     if(_loc3_.paramArr.length > 1)
                     {
                        if(_loc3_.paramArr[1] != "noScale")
                        {
                           if(_loc3_.paramArr[1] == "flagScale")
                           {
                              _loc5_.width = 29;
                              _loc5_.height = 18;
                           }
                           else
                           {
                              _loc15_ = 20;
                              _loc5_.height = _loc15_;
                              _loc5_.width = _loc15_;
                           }
                        }
                     }
                     _loc7_ = _loc5_;
                  }
               }
               else
               {
                  switch(int(_loc3_.style))
                  {
                     case 0:
                        _loc8_ = new WealthRenderLabelS0();
                        break;
                     case 1:
                        _loc8_ = new WealthRenderLabelS1();
                  }
                  if(_loc8_ is ILabelMedDisplay)
                  {
                     (_loc8_ as ILabelMedDisplay).label = param1;
                  }
                  _loc8_.wealthVo = WealthUtil.parseCostStr(_loc3_.param,false);
                  _loc7_ = _loc8_;
               }
               if(_loc7_)
               {
                  if(param1.isHtml)
                  {
                     _loc15_ = param2;
                     tf.htmlText = _loc15_;
                     §§push(_loc15_);
                  }
                  else
                  {
                     _loc15_ = param2;
                     tf.text = _loc15_;
                     §§push(_loc15_);
                  }
                  §§pop();
                  _loc4_ = tf.text.indexOf(_loc3_.oriStr1);
                  _loc6_ = Math.ceil(_loc7_.width / LocaleConsts.spaceWidth(int(param1.size)));
                  param2 = param2.replace(_loc3_.oriStr1,StringUtils.fillWithSameStr(" ",_loc6_));
                  _loc14_ = new LabelMedItem(param1,_loc4_,_loc7_);
                  if(param1.labelMedItemList == null)
                  {
                     param1.labelMedItemList = new Vector.<IDispose>();
                  }
                  param1.labelMedItemList.push(_loc14_);
               }
               _loc10_++;
            }
         }
         changeText(param1,param2);
         if(param1.labelMedItemList)
         {
            param1.commitMeasure();
            _loc9_ = param1.labelMedItemList.length;
            _loc10_ = 0;
            while(_loc10_ < _loc9_)
            {
               _loc12_ = param1.labelMedItemList[_loc10_] as LabelMedItem;
               _loc12_.checkAndShow();
               _loc10_++;
            }
         }
      }
      
      private function changeText(param1:Label, param2:String) : void
      {
         if(param1.isHtml)
         {
            var _loc3_:* = param2;
            param1.textField.htmlText = _loc3_;
            §§push(_loc3_);
         }
         else
         {
            _loc3_ = param2;
            param1.textField.text = _loc3_;
            §§push(_loc3_);
         }
      }
   }
}
