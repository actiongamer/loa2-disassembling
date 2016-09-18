package nslm2.modules.logModules
{
   import morn.customs.components.TopModuleView;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.KeyboardEvent;
   import flash.desktop.Clipboard;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.LocalData;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.globals.GlobalRef;
   import org.specter3d.context.AppGlobalContext;
   import morn.core.utils.ObjectUtils;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.mail.MailModel;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.miniNotice.MiniNoticeTimerManager;
   import nslm2.modules.otherPt.xunleis.XunLeiCheckKickRole;
   import com.greensock.TweenLite;
   import nslm2.modules.Chapters.ChapterService;
   import nslm2.modules.footstones.newerAutoCtrl.NewerAutoCtrl;
   
   public class GMCmdModule extends TopModuleView
   {
       
      
      private var startCharCode:int = 191;
      
      private var startCmd:int = 0;
      
      private var cmdStr:String = "";
      
      private var _uiVisible:Boolean = true;
      
      public function GMCmdModule()
      {
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         UIMgr.stage.addEventListener("keyDown",onKeyDow);
         super.preShow(param1);
      }
      
      private function onKeyDow(param1:KeyboardEvent) : void
      {
         var _loc2_:* = null;
         if(param1.keyCode == startCharCode)
         {
            startCmd = Number(startCmd) + 1;
            cmdStr = "";
         }
         else if(param1.keyCode == 13)
         {
            if(cmdStr)
            {
               checkCMD();
               startCmd = 0;
               cmdStr = "";
            }
         }
         else if(param1.ctrlKey && param1.keyCode == 86)
         {
            try
            {
               _loc2_ = Clipboard.generalClipboard.getData("air:text") as String;
               if(_loc2_)
               {
                  if(_loc2_.indexOf("//") == 0)
                  {
                     _loc2_ = _loc2_.replace("//","");
                     cmdStr = _loc2_;
                  }
               }
            }
            catch($err:Error)
            {
            }
         }
         else if(EnvConfig.ins.showDevModule && param1.ctrlKey && param1.keyCode == 112)
         {
            _uiVisible = !_uiVisible;
            ModuleMgr.ins.popLayer.visible = _uiVisible;
            ModuleMgr.ins.staticLayer.visible = _uiVisible;
            ObserverMgr.ins.sendNotice("msg_hide_dg_ui",_uiVisible);
         }
         else if(startCmd >= 2)
         {
            cmdStr = cmdStr + String.fromCharCode(param1.charCode);
         }
         else
         {
            startCmd = 0;
         }
      }
      
      private function checkCMD() : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = false;
         var _loc1_:* = null;
         Log.debug(this,"检测命令",this.cmdStr);
         if(!(EnvConfig.ins.simpleGM || EnvConfig.ins.showDevModule))
         {
            if(this.cmdStr.indexOf("nslm2 ") == -1)
            {
               return;
            }
            this.cmdStr = this.cmdStr.replace("nslm2 ","");
         }
         var _loc3_:Array = this.cmdStr.split(" ");
         var _loc5_:* = _loc3_[0];
         if("tne" !== _loc5_)
         {
            if("ptid" !== _loc5_)
            {
               if("sgm" !== _loc5_)
               {
                  if("arc" !== _loc5_)
                  {
                     if("ara" !== _loc5_)
                     {
                        if("ar" !== _loc5_)
                        {
                           if("s3d" !== _loc5_)
                           {
                              if("tc" !== _loc5_)
                              {
                                 if("m1" !== _loc5_)
                                 {
                                    if("nbc0" !== _loc5_)
                                    {
                                       if("fn" !== _loc5_)
                                       {
                                          if("statu" !== _loc5_)
                                          {
                                             if("logmod" !== _loc5_)
                                             {
                                                if("m4" !== _loc5_)
                                                {
                                                   if("fa" !== _loc5_)
                                                   {
                                                      if("ldc" !== _loc5_)
                                                      {
                                                         if("msg2" !== _loc5_)
                                                         {
                                                            if("msg1" !== _loc5_)
                                                            {
                                                               if("mni" !== _loc5_)
                                                               {
                                                                  if("vip" !== _loc5_)
                                                                  {
                                                                     if("kick" !== _loc5_)
                                                                     {
                                                                        if("ct" !== _loc5_)
                                                                        {
                                                                           if("autong" !== _loc5_)
                                                                           {
                                                                              if("pathmask" !== _loc5_)
                                                                              {
                                                                                 if("ma" !== _loc5_)
                                                                                 {
                                                                                    if("mac" !== _loc5_)
                                                                                    {
                                                                                       if("cr" === _loc5_)
                                                                                       {
                                                                                          ChapterService.ins.requestStageInfo();
                                                                                          AlertUtil.float("章节信息已重置");
                                                                                       }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                       LocalData.insCurPlayer.save("lastShowMallAlertTime",0);
                                                                                       AlertUtil.float("已清除商城提示时间");
                                                                                    }
                                                                                 }
                                                                                 else
                                                                                 {
                                                                                    ModuleMgr.ins.showModule(11202);
                                                                                 }
                                                                              }
                                                                              else
                                                                              {
                                                                                 ObserverMgr.ins.sendNotice("MSG_SCENE_PATH_MASK");
                                                                              }
                                                                           }
                                                                           else
                                                                           {
                                                                              TweenLite.delayedCall(1,delayAutoLoopfunction);
                                                                           }
                                                                        }
                                                                        else if(int(_loc3_[1]))
                                                                        {
                                                                           ModuleMgr.ins.showModule(60210,int(_loc3_[1]));
                                                                        }
                                                                     }
                                                                     else
                                                                     {
                                                                        XunLeiCheckKickRole.DELAY_TIME = _loc3_[1];
                                                                        AlertUtil.float(XunLeiCheckKickRole.DELAY_TIME);
                                                                     }
                                                                  }
                                                                  else
                                                                  {
                                                                     PlayerModel.ins.setVip(_loc3_[1]);
                                                                     ObserverMgr.ins.sendNotice("PLAYER_VIP_UP",0);
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  MiniNoticeTimerManager.initTimer();
                                                                  AlertUtil.float("活动通知timer重置完毕");
                                                               }
                                                            }
                                                            else
                                                            {
                                                               _loc1_ = LinkUtils.playerName(PlayerModel.ins.playerInfo.id,"测试",1,16542720,null,0,101) + "获得了" + LinkUtils.stcItemName(13230);
                                                               FloatUtil.sendEventNotice([1,2,3,4,5],_loc1_);
                                                            }
                                                         }
                                                         else
                                                         {
                                                            _loc1_ = " friend @{vipIcon:1:0:0}online!";
                                                            FloatUtil.sendEventNotice([1,2,3,4,5],_loc1_);
                                                         }
                                                      }
                                                      else
                                                      {
                                                         LocalData.insCurPlayer.clear();
                                                         AlertUtil.float("LocalData清除完毕");
                                                      }
                                                   }
                                                   else
                                                   {
                                                      VipModel.ins.canGetFavoriteReward = true;
                                                      ModuleMgr.ins.showModule(60520);
                                                   }
                                                }
                                                else
                                                {
                                                   ObserverMgr.ins.sendNotice("MSG_TOP_CENTER_HORSE_LAMP","中文走马灯测试" + _loc3_[1]);
                                                }
                                             }
                                             else
                                             {
                                                ModuleMgr.ins.showModule(90300);
                                             }
                                          }
                                          else
                                          {
                                             AppGlobalContext.stage3d.debugStats = !AppGlobalContext.stage3d.debugStats;
                                          }
                                       }
                                       else
                                       {
                                          NpcFuncService.ins.changeCount(_loc3_[1],_loc3_[2]);
                                       }
                                    }
                                    else
                                    {
                                       NGUtil.switchBlackCoverScene3D(false);
                                    }
                                 }
                                 else
                                 {
                                    MailModel.ins.dispatchEvent(new MzEvent("mailInfoChange",null,true));
                                 }
                              }
                              else
                              {
                                 Log.debug(this,"EnvConfig",ObjectUtils.__debugByDescribe(EnvConfig.ins));
                                 Log.debug(this,"ClientConfig",ObjectUtils.__debugByDescribe(ClientConfig));
                                 FloatUtil.showGetItemsDisplayPanel([WealthUtil.createStcVo(4,0,14891),WealthUtil.createStcVo(20,12130,3)]);
                              }
                           }
                           else
                           {
                              _loc4_ = Boolean(LocalData.insCurPlayer.load("showStatue3d",false));
                              _loc4_ = !_loc4_;
                              LocalData.insCurPlayer.save("showStatue3d",_loc4_);
                              AppGlobalContext.stage3d.debugStats = _loc4_;
                              AlertUtil.float("showStatue3d is " + _loc4_);
                           }
                        }
                        else
                        {
                           GlobalRef.needAutoRefresh = true;
                           AlertUtil.float("回到主城刷新游戏 is open");
                        }
                     }
                     else
                     {
                        _loc4_ = Boolean(LocalData.insCurPlayer.load("isRefreshAutoAlways",false));
                        _loc4_ = !_loc4_;
                        LocalData.insCurPlayer.save("isRefreshAutoAlways",_loc4_);
                        AlertUtil.float("回到主城一直刷新游戏 is " + _loc4_);
                     }
                  }
                  else
                  {
                     GlobalRef.RAM_MAX = int(_loc3_[1]) * 1024 * 1024;
                     AlertUtil.float("内存最大值改成 " + GlobalRef.RAM_MAX);
                  }
               }
               else
               {
                  _loc4_ = Boolean(LocalData.insCurPlayer.load("SIMPLE_GM",false));
                  _loc4_ = !_loc4_;
                  EnvConfig.ins.simpleGM = _loc4_;
                  LocalData.insCurPlayer.save("SIMPLE_GM",_loc4_);
                  AlertUtil.float("simple GM cmd is " + _loc4_);
               }
            }
            else
            {
               EnvConfig.ins.ptId = _loc3_[1];
               AlertUtil.float("EnvConfig.ins.ptId改成 " + EnvConfig.ins.ptId);
            }
         }
         else
         {
            _loc2_ = LocalData.insCurPlayer.load("test net error",0);
            _loc2_ = 5;
            LocalData.insCurPlayer.save("test net error",_loc2_);
            AlertUtil.float("test net error cmd is " + _loc2_);
         }
         ObserverMgr.ins.sendNotice("MSG_GM_CMD",this.cmdStr.split(" "));
      }
      
      private function delayAutoLoopfunction() : void
      {
         NewerAutoCtrl.ins.doAutoLoop();
      }
   }
}
