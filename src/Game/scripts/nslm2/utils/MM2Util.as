package nslm2.utils
{
   import morn.core.components.Button;
   import nslm2.mgrs.skins.Effect2DUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Image;
   import proto.PublicTalkReq;
   import proto.TalkContent;
   import com.greensock.TweenLite;
   import com.netease.protobuf.Message;
   import nslm2.nets.sockets.ServerEngine;
   
   public class MM2Util
   {
       
      
      public function MM2Util()
      {
         super();
      }
      
      public static function getSizeByBtnStyle(param1:String) : int
      {
         var _loc2_:* = param1;
         if("按钮大蓝充值" !== _loc2_)
         {
            if("按钮大红" !== _loc2_)
            {
               if("按钮大蓝" !== _loc2_)
               {
                  if("按钮大绿" !== _loc2_)
                  {
                     if("按钮大黄" !== _loc2_)
                     {
                        if("按钮中红" !== _loc2_)
                        {
                           if("按钮中蓝" !== _loc2_)
                           {
                              if("按钮中绿" !== _loc2_)
                              {
                                 if("按钮中黄" !== _loc2_)
                                 {
                                    if("按钮中棕" !== _loc2_)
                                    {
                                       return 8;
                                    }
                                 }
                                 addr20:
                                 return 5;
                              }
                              addr19:
                              §§goto(addr20);
                           }
                           addr18:
                           §§goto(addr19);
                        }
                        §§goto(addr18);
                     }
                  }
                  addr12:
                  return 6;
               }
               addr11:
               §§goto(addr12);
            }
            §§goto(addr11);
         }
         else
         {
            return 7;
         }
      }
      
      public static function rewardBtnState(param1:Button, param2:int, param3:int = 0) : void
      {
         if(param3 == 0)
         {
            param3 = MM2Util.getSizeByBtnStyle(param1.style);
         }
         switch(int(param2) - 1)
         {
            case 0:
               Effect2DUtils.changeBtnEff(false,param1,param3);
               param1.disabled = true;
               param1.label = LocaleMgr.ins.getStr(10700007);
               break;
            case 1:
               Effect2DUtils.changeBtnEff(true,param1,param3);
               param1.disabled = false;
               param1.label = LocaleMgr.ins.getStr(10700007);
               break;
            case 2:
               Effect2DUtils.changeBtnEff(false,param1,param3);
               param1.disabled = true;
               param1.label = LocaleMgr.ins.getStr(10600041);
         }
      }
      
      public static function rewardBtnImgState(param1:Button, param2:Image, param3:int, param4:int) : void
      {
         if(param4 == 0)
         {
            param4 = MM2Util.getSizeByBtnStyle(param1.style);
         }
         switch(int(param3) - 1)
         {
            case 0:
               Effect2DUtils.changeBtnEff(false,param1,param4);
               param1.visible = true;
               param1.disabled = true;
               param1.label = LocaleMgr.ins.getStr(10700007);
               param2.visible = false;
               break;
            case 1:
               Effect2DUtils.changeBtnEff(true,param1,param4);
               param1.visible = true;
               param1.disabled = false;
               param1.label = LocaleMgr.ins.getStr(10700007);
               param2.visible = false;
               break;
            case 2:
               Effect2DUtils.changeBtnEff(false,param1,param4);
               param1.visible = false;
               param2.visible = true;
         }
      }
      
      public static function gm_getItem(param1:Array, param2:int) : void
      {
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc3_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc4_ = param1[_loc7_];
            _loc6_ = new PublicTalkReq();
            _loc6_.pindao = 0;
            _loc5_ = new TalkContent();
            _loc5_.content = "//additem id=" + _loc4_ + " num=" + param2 + "^#@" + "^#@";
            _loc6_.content = _loc5_;
            TweenLite.delayedCall(_loc7_ * 0.1,gm_getItem_delaySend,[_loc6_]);
            _loc7_++;
         }
      }
      
      private static function gm_getItem_delaySend(param1:Message) : void
      {
         ServerEngine.ins.send(6001,param1);
      }
   }
}
