package nslm2.modules.foundations.mainToolBar
{
   import game.ui.mainToolBar.BottomIconRenderTopRightUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Label;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GetCommentInfoReq;
   import morn.core.utils.URLUtils;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.GetCommentInfoRes;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS2;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.vos.StcNewFunctionVo;
   import nslm2.modules.foundations.sales.model.SalesModel;
   import morn.customs.FilterLib;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.LocalData;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
   import com.greensock.TweenLite;
   import com.mz.core.configs.ClientConfig;
   
   public class BottomIconRenderTopRight extends BottomIconRenderTopRightUI implements IObserver
   {
      
      public static var WW:int = 70;
      
      public static const HH:int = 64;
      
      public static const durationGap:Number = 0.1;
      
      public static const duration:Number = 0.2;
       
      
      protected var rollMed:RoleGrowFilterMed;
      
      private var _timerLabel:Label;
      
      private var _cntDown:int;
      
      private var _taskAlertRender:TaskAlertRenderS2;
      
      private var foreshowAlert:BmcSpriteSheet;
      
      private var _bottomEff:BmcSpriteSheet;
      
      public var redPointArr:Vector.<nslm2.modules.foundations.mainToolBar.RedPointVo>;
      
      public var isVertical:Boolean = false;
      
      public var tempPos:int = -1;
      
      public var newPos:int = -1;
      
      public var singleLineShowNum:int;
      
      public function BottomIconRenderTopRight()
      {
         if(ClientConfig.isChineseLang())
         {
            WW = 70;
         }
         else
         {
            WW = 75;
         }
         super();
         this.img_redPoi.visible = true;
         this.txt_time.visible = false;
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.buttonMode = true;
         rollMed = new RoleGrowFilterMed(this.box_icon,null);
         this.parts.push(new RoleGrowFilterMed(this.box_icon,null));
         this.box_icon.addEventListener("click",icon_click);
         this.txt_names.centerX = -14;
         ObserverMgr.ins.regObserver(this);
      }
      
      private function onTimer() : void
      {
         _cntDown = Number(_cntDown) - 1;
         if(_timerLabel)
         {
            _timerLabel.num = _cntDown;
         }
         if(_cntDown == 0)
         {
            TimerManager.ins.clearTimer(onTimer);
            if(_timerLabel)
            {
               if(_timerLabel.parent)
               {
                  this.removeChild(_timerLabel);
               }
               _timerLabel.dispose();
               _timerLabel = null;
            }
         }
      }
      
      protected function icon_click(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         if(ActivityModel.ins.isFuncInForeshow(this.moduleId))
         {
            ActivityModel.ins.initForeshowFuncId = this.moduleId;
            ModuleMgr.ins.showOrCloseModule(60777);
            hideActivityForeshowAlert();
            return;
         }
         var _loc3_:* = this.moduleId;
         if(13333 !== _loc3_)
         {
            if(90002 !== _loc3_)
            {
               if(40760 !== _loc3_)
               {
                  ModuleMgr.ins.showOrCloseModule(this.moduleId);
               }
               else
               {
                  _loc2_ = PlayerModel.ins.playerInfo.familyId;
                  if(_loc2_)
                  {
                     ModuleMgr.ins.showOrCloseModule(this.moduleId);
                  }
                  else
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(999902830));
                  }
               }
            }
            else if(EnvConfig.ins.ptId == 592)
            {
               ServerEngine.ins.send(10034,new GetCommentInfoReq(),getChronicleData);
            }
            else
            {
               URLUtils.openWindow("http://loa2.gtarcade.com/data");
            }
         }
         else
         {
            if(EnvConfig.ins.showDevModule && param1.altKey)
            {
               ModuleMgr.ins.showOrCloseModule(13336,22000);
               return;
            }
            if(NpcFuncService.ins.isOpenTime(13336))
            {
               ModuleMgr.ins.showOrCloseModule(13336);
            }
            else if(NpcFuncService.ins.isOpenTime(13333))
            {
               ModuleMgr.ins.showOrCloseModule(13333);
            }
            else
            {
               AlertUtil.floadFuncTimeIsExpire();
               ObserverMgr.ins.sendNotice("updateIconBar");
            }
         }
      }
      
      private function getChronicleData(param1:GetCommentInfoRes) : void
      {
         var _loc2_:String = "http://loa2.gtarcade.com/data/comment/comeFthird";
         _loc2_ = _loc2_ + "?serverid=";
         _loc2_ = _loc2_ + param1.serverid;
         _loc2_ = _loc2_ + "&rolename=";
         _loc2_ = _loc2_ + param1.rolename;
         _loc2_ = _loc2_ + "&gameid=";
         _loc2_ = _loc2_ + param1.gameid;
         _loc2_ = _loc2_ + "&dt=";
         _loc2_ = _loc2_ + param1.dt;
         _loc2_ = _loc2_ + "&opid=";
         _loc2_ = _loc2_ + param1.opid;
         _loc2_ = _loc2_ + "&sign=";
         _loc2_ = _loc2_ + param1.sign;
         URLUtils.openWindow(_loc2_);
      }
      
      public function get moduleId() : int
      {
         return this.dataSource as int;
      }
      
      public function set moduleId(param1:int) : void
      {
         this.dataSource = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         .super.dataSource = param1;
         var _loc2_:String = "";
         if(this.moduleId > 0)
         {
            FuncOpenAutoCtrl.updateFuncBtnStateTip(this.moduleId,this.stateIcon);
            if(this.moduleId == 60710)
            {
               switch(int(EnvConfig.ins.vipType) - 1)
               {
                  case 0:
                     _loc2_ = _loc2_ + "_y_";
                     if(NpcFuncService.ins.getVo(60710).extra == true)
                     {
                        _loc2_ = _loc2_ + "1";
                     }
                     else
                     {
                        _loc2_ = _loc2_ + "0";
                     }
                     this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId,_loc2_);
                     this.toolTip = LocaleMgr.ins.getStr(9000000 + 60718);
                     this.txt_names.text = LocaleMgr.ins.getStr(9000000 + 60718);
                     break;
                  case 1:
                     _loc2_ = _loc2_ + "_b_";
                     if(NpcFuncService.ins.getVo(60710).extra == true)
                     {
                        _loc2_ = _loc2_ + "1";
                     }
                     else
                     {
                        _loc2_ = _loc2_ + "0";
                     }
                     this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId,_loc2_);
                     this.toolTip = LocaleMgr.ins.getStr(60710615);
                     this.txt_names.text = LocaleMgr.ins.getStr(9000000 + 60719);
               }
            }
            else if(this.moduleId == 60721)
            {
               _loc2_ = _loc2_ + "_b_";
               if(NpcFuncService.ins.getVo(60721).extra == true)
               {
                  _loc2_ = _loc2_ + "1";
               }
               else
               {
                  _loc2_ = _loc2_ + "0";
               }
               this.img_bg.skin = UrlLib.mainToolBarIcon(60710,_loc2_);
               this.toolTip = LocaleMgr.ins.getStr(999000302);
               this.txt_names.text = LocaleMgr.ins.getStr(999000302);
            }
            else if(this.moduleId == 60510)
            {
               if(EnvConfig.ins.ptId == 15)
               {
                  this.img_bg.skin = UrlLib.mainToolBarIcon(60511,_loc2_);
                  _loc3_ = LocaleMgr.ins.getStr(9000000 + 60511);
                  this.txt_names.text = _loc3_;
                  this.toolTip = LocaleMgr.ins.getStr(9000000 + 60511);
               }
               else if(EnvConfig.ins.ptId == 82)
               {
                  this.img_bg.skin = UrlLib.mainToolBarIcon(60512,_loc2_);
                  _loc3_ = LocaleMgr.ins.getStr(9000000 + this.moduleId);
                  this.txt_names.text = _loc3_;
               }
               else
               {
                  this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId);
                  _loc3_ = LocaleMgr.ins.getStr(9000000 + this.moduleId);
                  this.txt_names.text = _loc3_;
                  this.toolTip = LocaleMgr.ins.getStr(9000000 + this.moduleId);
               }
            }
            else if(ActivityModel.ins.isFuncInForeshow(this.moduleId))
            {
               _loc4_ = ActivityModel.ins.getForeshowFuncList();
               _loc7_ = 0;
               while(_loc7_ < _loc4_.length)
               {
                  _loc5_ = _loc4_[_loc7_] as StcNewFunctionVo;
                  if(_loc5_.function_id != this.moduleId)
                  {
                     _loc7_++;
                     continue;
                  }
                  break;
               }
               this.img_bg.skin = UrlLib.foreshowToolBarIcon(_loc5_.icon);
               _loc3_ = LocaleMgr.ins.getStr(_loc5_.title);
               this.txt_names.text = _loc3_;
            }
            else
            {
               this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId);
               _loc3_ = LocaleMgr.ins.getStr(9000000 + this.moduleId);
               this.txt_names.text = _loc3_;
               this.toolTip = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            }
            if(this.moduleId == 60540 && SalesModel.ins.showHint || this.moduleId == 13300)
            {
               this.box_salesRefreshed.visible = true;
               if(this.moduleId == 13300)
               {
                  this.txt_content.text = LocaleMgr.ins.getStr(13300001);
               }
            }
            else
            {
               this.box_salesRefreshed.visible = false;
            }
            this.txt_names.textWidth;
            if(this.txt_names.textField.numLines >= 3)
            {
               this.txt_names.width = this.txt_names.width + 12;
               _loc6_ = this.txt_names.text;
               this.txt_names.text = "";
               this.txt_names.text = _loc6_;
            }
            this.txt_names.textWidth;
            this.txt_names.textHeight;
            this.txt_names.width = txt_names.textField.textWidth + 5;
            this.txt_names.height = txt_names.textField.textHeight + 5;
            rollMed.glowFilter = FilterLib.BORDER_YELLOW;
            if(this.moduleId == 60200)
            {
               if(NGUtil.isCurFuncId(40500) == false && FloatBubbleUtil.needShow(1100))
               {
                  if(_taskAlertRender == null)
                  {
                     _taskAlertRender = new TaskAlertRenderS2();
                     _taskAlertRender.y = 128;
                     _taskAlertRender.x = 138;
                  }
                  FloatBubbleUtil.addOneTime(1100.toString());
               }
               else if(_taskAlertRender)
               {
                  _taskAlertRender.dispose();
                  _taskAlertRender = null;
               }
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
         else
         {
            this.toolTip = null;
            rollMed.glowFilter = null;
         }
         this.validateRedPoint();
         if(ActivityModel.ins.isFuncInForeshow(this.moduleId))
         {
            showActivityForeshowAlert();
         }
      }
      
      private function showActivityForeshowAlert() : void
      {
         if(LocalData.insCurPlayer.load("HAS_FORESHOW_CLICK_" + this.moduleId,false) == false)
         {
            if(foreshowAlert == null)
            {
               foreshowAlert = new BmcSpriteSheet();
               foreshowAlert.x = -5;
               foreshowAlert.y = -6;
               foreshowAlert.init(115004,1,"all",true);
            }
            this.addChild(foreshowAlert);
         }
         this.box_salesRefreshed.visible = true;
         this.box_salesRefreshed.y = 40;
         this.txt_content.text = LocaleMgr.ins.getStr(999001104);
         this.txt_content.size = 11;
         this.txt_content.commitMeasure();
         this.txt_bg.alpha = 0.7;
         this.txt_bg.skin = "png.a5.bgs.panelBgs.img_panelBg11";
         this.txt_bg.sizeGrid = "5,5,5,5";
         this.txt_bg.anchorY = 0;
         this.txt_bg.y = this.txt_content.y - 3;
         this.txt_content.x = this.txt_bg.x - this.txt_content.width / 2;
         this.txt_bg.width = this.txt_content.textWidth + 10;
         this.txt_bg.height = this.txt_content.textHeight + 10;
      }
      
      private function hideActivityForeshowAlert() : void
      {
         if(foreshowAlert)
         {
            LocalData.insCurPlayer.save("HAS_FORESHOW_CLICK_" + this.moduleId,true,true);
            DisplayUtils.removeSelf(foreshowAlert);
            foreshowAlert.dispose();
            foreshowAlert = null;
         }
      }
      
      public function validateRedPoint() : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         var _loc1_:* = null;
         this.img_redPoi.visible = false;
         this.countPoint.visible = false;
         if(redPointArr)
         {
            if(this.moduleId > 0)
            {
               _loc3_ = ArrayUtil.findByAttr(redPointArr,"moduleID",moduleId);
               if(_loc3_ == null)
               {
                  _loc2_ = NpcFuncService.ins.getVo(this.moduleId);
                  if(_loc2_ && _loc2_.count > 0)
                  {
                     _loc3_ = new nslm2.modules.foundations.mainToolBar.RedPointVo(this.moduleId,_loc2_.count == 1?0:_loc2_.count);
                  }
                  _loc1_ = "";
                  if(this.moduleId == 60710)
                  {
                     switch(int(EnvConfig.ins.vipType) - 1)
                     {
                        case 0:
                           _loc1_ = _loc1_ + "_y_";
                           if(_loc2_.extra == true)
                           {
                              _loc1_ = _loc1_ + "1";
                           }
                           else
                           {
                              _loc1_ = _loc1_ + "0";
                           }
                           this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId,_loc1_);
                           break;
                        case 1:
                           _loc1_ = _loc1_ + "_b_";
                           if(_loc2_.extra == true)
                           {
                              _loc1_ = _loc1_ + "1";
                           }
                           else
                           {
                              _loc1_ = _loc1_ + "0";
                           }
                           this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId,_loc1_);
                     }
                  }
                  else if(this.moduleId == 60721)
                  {
                     _loc1_ = _loc1_ + "_b_";
                     if(_loc2_.extra == true)
                     {
                        _loc1_ = _loc1_ + "1";
                     }
                     else
                     {
                        _loc1_ = _loc1_ + "0";
                     }
                     this.img_bg.skin = UrlLib.mainToolBarIcon(60710,_loc1_);
                  }
               }
               if(_loc3_)
               {
                  if(this.moduleId == 13333)
                  {
                     if(!NpcFuncService.ins.isOpenTime(13334))
                     {
                        if(NpcFuncService.ins.isOpenTime(13336))
                        {
                           _loc3_.count = 0;
                        }
                        else
                        {
                           _loc3_.count = 0;
                        }
                     }
                  }
                  if(_loc3_.count > 0)
                  {
                     this.countPoint.visible = true;
                     this.countPoint.txt_count.text = _loc3_.count + "";
                     this.img_redPoi.visible = false;
                  }
                  else
                  {
                     this.countPoint.visible = false;
                     this.img_redPoi.visible = true;
                  }
                  if(_bottomEff)
                  {
                     _bottomEff.gotoAndPlay(1);
                  }
                  else
                  {
                     _bottomEff = new BmcSpriteSheet();
                     _bottomEff.x = -5;
                     _bottomEff.y = -6;
                     _bottomEff.init(115004,1,"all",true);
                     this.addChild(_bottomEff);
                  }
               }
               else if(_bottomEff)
               {
                  DisplayUtils.removeSelf(_bottomEff);
                  _bottomEff.dispose();
                  _bottomEff = null;
               }
            }
         }
      }
      
      public function tweenTemp(param1:Boolean) : void
      {
         param1 = true;
         if(isVertical)
         {
            TweenLite.to(this,!!param1?0:0.2,{
               "y":0,
               "onComplete":tweenTempCpl
            });
         }
         else
         {
            TweenLite.to(this,!!param1?0:0.2,{
               "x":-WW * 0,
               "onComplete":tweenTempCpl
            });
         }
      }
      
      private function tweenTempCpl() : void
      {
         if(this.newPos == -1)
         {
            this.dispose();
         }
         else if(isVertical)
         {
            TweenLite.to(this,0.1 * (newPos + 1),{"y":-64 * (newPos + 1)});
         }
         else
         {
            this.x = -WW * (newPos % singleLineShowNum + 1);
            this.y = 64 * Math.floor(newPos / singleLineShowNum);
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         TimerManager.ins.clearTimer(onTimer);
         if(_timerLabel)
         {
            DisplayUtils.removeSelf(_timerLabel);
            _timerLabel = null;
         }
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE","SalesReset","HintReset","MSG_UPDATE_FUNCTION_NEW"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" !== _loc3_)
         {
            if("SalesReset" !== _loc3_)
            {
               if("HintReset" !== _loc3_)
               {
                  if("MSG_UPDATE_FUNCTION_NEW" === _loc3_)
                  {
                     FuncOpenAutoCtrl.updateFuncBtnStateTip(this.moduleId,this.stateIcon);
                  }
               }
               else if(this.moduleId == 13300)
               {
                  this.box_salesRefreshed.visible = false;
               }
            }
            else if(this.moduleId == 60540)
            {
               this.box_salesRefreshed.visible = SalesModel.ins.showHint;
            }
         }
         else if(param2 == this.moduleId)
         {
            this.validateRedPoint();
         }
      }
   }
}
