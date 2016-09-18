package nslm2.modules.foundations.firstCharge
{
   import game.ui.firstChargeModule.FirstChargeViewUI;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.modules.scenes.commons.UIUnit3DS2;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.common.vo.WealthVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.foundations.vip.model.VipModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.utils.WealthUtil;
   import proto.Item;
   import nslm2.utils.Uint64Util;
   import flash.display.Sprite;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import org.specter3d.loaders.ResourceVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.managers.timerMgrs.TimerManager;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import away3d.events.MouseEvent3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSaddlehorseVo;
   import flash.ui.Mouse;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.ConfigUtil;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import nslm2.modules.cultivates.horse.HorseConsts;
   import proto.GetVipInfoRes;
   import proto.VipGetFirstChargeRes;
   import away3d.cameras.lenses.OrthographicLens;
   import nslm2.modules.foundations.vip.service.VipService;
   
   public class FirstChargeView extends FirstChargeViewUI
   {
       
      
      private var panel3D:UIPanel3D;
      
      private var img:Image3D;
      
      private var weapon:UIWeapon3D;
      
      private var wolf:UIUnit3DS2;
      
      private var avatar:UIUnit3DS2;
      
      private var avatar2:UIUnit3DS2;
      
      private var avatar3:UIUnit3DS2;
      
      private var _status:int;
      
      private const HAVE_NOT_CHARGED_YET:int = 1;
      
      private const CAN_GET_REWARD:int = 2;
      
      private const HAVE_GOT_REWARD:int = 3;
      
      private var eff:SpecterEffect;
      
      private var _weaponModelId:int;
      
      private var _weaponVo:WealthVo;
      
      private var _horseVo:StcItemVo;
      
      public function FirstChargeView()
      {
         wolf = new UIUnit3DS2();
         avatar = new UIUnit3DS2();
         super();
         var _loc1_:Object = AppGlobalContext.stage3d.camera3d;
         (_loc1_.lens as OrthographicLens).projectionHeight = 900;
         VipService.ins.getFirstChargeInfo(cplHandler);
         this.btn_close.clickHandler = closeHandler;
         this.btn_charge.clickHandler = clickHandler;
         this.moduleFadeInType = 0;
         this.avatar2 = new UIUnit3DS2();
         this.avatar3 = new UIUnit3DS2();
      }
      
      private function clickHandler() : void
      {
         if(_status == 1)
         {
            VipModel.ins.gotoCharge();
         }
         else if(_status == 2)
         {
            ServerEngine.ins.send(6406,null,getRewardHandler);
         }
         else
         {
            this.btn_charge.disabled = true;
         }
      }
      
      private function getRewardHandler() : void
      {
         _status = 3;
         this.btn_charge.disabled = true;
         this.btn_charge.label = LocaleMgr.ins.getStr(999000234);
         VipModel.ins.canGetFirstChargeReward = false;
         TweenLite.killTweensOf(this.img_light);
         this.img_light.visible = false;
         FloatUtil.showGetItemsDisplayPanel(this.list_reward.dataSource as Array);
         ObserverMgr.ins.sendNotice("updateIconBar");
      }
      
      private function closeHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      public function get layer3D() : ObjectContainer3D
      {
         return AppGlobalContext.stage3d.view3d2Layer3D;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc3_:Array = WealthUtil.dropGroupIDToWealthVoArr(930000);
         var _loc2_:WealthVo = _loc3_[0] as WealthVo;
         var _loc4_:Item = new Item();
         _loc4_.strengthId = 41020;
         _loc4_.itemId = _loc2_.sid;
         _loc4_.ability = Uint64Util.fromNumber(4100);
         _loc2_.item = _loc4_;
         this.list_reward.dataSource = _loc3_;
         var _loc5_:Sprite = new Sprite();
         _loc5_.graphics.beginFill(0);
         _loc5_.graphics.drawRect(this.btn_charge.x + 20,this.btn_charge.y + 22,144,34);
         addChild(_loc5_);
         this.img_light.mask = _loc5_;
         this.img_light.alpha = 1;
         this.centerX = 0;
         this.centerY = 0;
         var _loc10_:int = 0;
         var _loc9_:* = list_reward.array;
         for each(var _loc8_ in list_reward.array)
         {
            if(_loc8_.stcItemVo)
            {
               if(_loc8_.stcItemVo.kind != 1)
               {
                  if(_loc8_.stcItemVo.kind == 11)
                  {
                     _horseVo = _loc8_.stcItemVo;
                     addHorse((_horseVo.id % 70000 + 10) * 100);
                  }
               }
            }
         }
         this.createAvatar3D(16000,this.avatar);
         this.createAvatar3D(17000,this.avatar2);
         this.createAvatar3D(13000,this.avatar3);
         _loc7_ = 0;
         while(_loc7_ < this.list_reward.array.length)
         {
            if((this.list_reward.array[_loc7_] as WealthVo).quality >= 4)
            {
               _loc6_ = new BmcSpriteSheet();
               _loc6_.x = list_reward.x + this.list_reward.cells[_loc7_].x;
               _loc6_.y = list_reward.y + this.list_reward.cells[_loc7_].y;
               _loc6_.x = _loc6_.x + -18;
               _loc6_.y = _loc6_.y + -11;
               _loc6_.scaleAll = 0.846153846153846;
               _loc6_.init(800000,1,"all",true);
               this.addChild(_loc6_);
               _loc6_.mouseChildren = false;
               _loc6_.mouseEnabled = false;
            }
            _loc7_++;
         }
         AppGlobalContext.asynLoader.loadOne(new ResourceVo(UrlLib.img_firstCharge()),img_bg_loadCpl);
      }
      
      private function img_bg_loadCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         img = new Image3D(UrlLib.img_firstCharge(),0,0,1000,false,true);
         TimerManager.ins.doOnce(1000,doTween);
         super.preShow();
      }
      
      public function doTween() : void
      {
         TweenLite.to(this.img_light,1.4,{
            "x":649,
            "y":496,
            "onComplete":tweenCpl
         });
      }
      
      public function tweenCpl() : void
      {
         img_light.x = 363;
         img_light.y = 496;
         TimerManager.ins.doOnce(1000,doTween);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         AppGlobalContext.stage3d.view3d2.mouseChildren = true;
         AppGlobalContext.stage3d.view3d2.mouseEnabled = true;
         this.layer3D.addChild(img);
         img.x = img.x - 100;
         img.y = img.y + 30;
         img.z = 1000;
         this.layer3D.addChild(avatar);
         avatar.mouseChildren = true;
         avatar.mouseEnabled = true;
         avatar.x = 327;
         avatar.y = -226;
         avatar.addEventListener("mouseOver3d",mouseOver);
         avatar.addEventListener("mouseOut3d",mouseOut);
         if(this.avatar2)
         {
            this.layer3D.addChild(avatar2);
            avatar2.mouseChildren = true;
            avatar2.mouseEnabled = true;
            avatar2.x = 247;
            avatar2.y = -196;
            avatar2.z = 400;
            avatar2.addEventListener("mouseOver3d",mouseOver);
            avatar2.addEventListener("mouseOut3d",mouseOut);
         }
         if(this.avatar3)
         {
            this.layer3D.addChild(avatar3);
            avatar3.mouseChildren = true;
            avatar3.mouseEnabled = true;
            avatar3.x = 407;
            avatar3.y = -196;
            avatar3.z = 800;
            avatar3.addEventListener("mouseOver3d",mouseOver);
            avatar3.addEventListener("mouseOut3d",mouseOut);
         }
         if(avatar2 == null)
         {
            TweenLite.delayedCall(3,doWinAct);
         }
         this.layer3D.addChild(wolf);
         wolf.x = -333;
         wolf.y = -217;
         wolf.rotationY = -30;
         wolf.mouseChildren = true;
         wolf.mouseEnabled = true;
         wolf.addEventListener("mouseOver3d",mouseOver);
         wolf.addEventListener("mouseOut3d",mouseOut);
         ModuleMgr.ins.staticLayer.switchVisible("first_charge",false);
         ModuleMgr.ins.sceneLayer.switchVisible("first_charge",false);
         NGUtil.checkModuleShow(this.moduleId);
      }
      
      private function winAct() : void
      {
      }
      
      private function doWinAct() : void
      {
         winAct();
         TimerManager.ins.doLoop(6000,winAct);
      }
      
      private function onLoaded(param1:SpecterEffect) : void
      {
         param1.scaleX = 0.45;
         param1.scaleY = 0.88;
         param1.y = param1.y - 200;
         param1.x = -360;
      }
      
      private function mouseOver(param1:MouseEvent3D) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1.target;
         if(wolf !== _loc3_)
         {
            if(weapon !== _loc3_)
            {
               if(avatar !== _loc3_)
               {
                  if(avatar2 !== _loc3_)
                  {
                     if(avatar3 === _loc3_)
                     {
                        Mouse.cursor = "arrow";
                        ObserverMgr.ins.sendNotice("msg_tooltip_show",StcMgr.ins.getNpcVo(13000));
                     }
                  }
                  else
                  {
                     Mouse.cursor = "arrow";
                     ObserverMgr.ins.sendNotice("msg_tooltip_show",StcMgr.ins.getNpcVo(17000));
                  }
               }
               else
               {
                  Mouse.cursor = "arrow";
                  ObserverMgr.ins.sendNotice("msg_tooltip_show",StcMgr.ins.getNpcVo(16000));
               }
            }
            else
            {
               ObserverMgr.ins.sendNotice("msg_tooltip_show",_weaponVo);
            }
         }
         else
         {
            _loc2_ = StcMgr.ins.getSaddlehorseVo((_horseVo.id % 70000 + 10) * 100);
            Mouse.cursor = "arrow";
            ObserverMgr.ins.sendNotice("msg_tooltip_show",_loc2_);
         }
      }
      
      private function mouseOut(param1:MouseEvent3D) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.switchVisible("first_charge",true);
         ModuleMgr.ins.sceneLayer.switchVisible("first_charge",true);
         AppGlobalContext.stage3d.view3d2.mouseChildren = false;
         AppGlobalContext.stage3d.view3d2.mouseEnabled = false;
         TweenLite.killDelayedCallsTo(doWinAct);
         TimerManager.ins.clearTimer(winAct);
         if(weapon)
         {
            weapon.dispose();
         }
         if(img)
         {
            img.dispose();
         }
         if(wolf)
         {
            wolf.dispose();
         }
         if(eff)
         {
            eff.dispose();
         }
         if(avatar)
         {
            avatar.removeEventListener("mouseOver3d",mouseOver);
            avatar.removeEventListener("mouseOut3d",mouseOut);
            avatar.dispose();
            avatar = null;
         }
         if(avatar2)
         {
            avatar2.removeEventListener("mouseOver3d",mouseOver);
            avatar2.removeEventListener("mouseOut3d",mouseOut);
            avatar2.dispose();
            avatar2 = null;
         }
         if(avatar3)
         {
            avatar3.removeEventListener("mouseOver3d",mouseOver);
            avatar3.removeEventListener("mouseOut3d",mouseOut);
            avatar3.dispose();
            avatar3 = null;
         }
         super.preClose(param1);
      }
      
      private function addWeapon(param1:int, param2:int) : void
      {
         _weaponModelId = param1;
         var _loc3_:StcModelVo = StcMgr.ins.getModelVo(param1);
         if(_loc3_ && StringUtils.isNull(_loc3_.extra) == false)
         {
            ConfigUtil.setWeaponUIExtra(weapon,_loc3_.extra);
         }
         else
         {
            weapon.position = new Vector3D(0,-40,0);
            weapon.scaleAll = 1.21;
         }
         weapon.position = new Vector3D(-119,-84,0);
         weapon.eulers = new Vector3D(0,0,36);
         weapon.scaleAll = 1.81;
         weapon.initByModelId(param1);
         weapon.changeEff(String(param2));
      }
      
      private function createAvatar3D(param1:*, param2:UIUnit3DS2 = null) : void
      {
         if(param2)
         {
            param2.visible = true;
            param2.initByStcNpcId(param1);
            param2.pos2d = new Point(-100,-130);
            param2.rotation = -90;
         }
      }
      
      private function addHorse(param1:int) : void
      {
         var _loc2_:StcSaddlehorseVo = StcMgr.ins.getSaddlehorseVo(param1);
         this.wolf.initHorseModel(int(_loc2_.model),2);
         this.wolf.pos2d = HorseConsts.AVATAR3D_POS.add(new Point(52));
         this.wolf.rotation = -145;
      }
      
      private function cplHandler1(param1:GetVipInfoRes) : void
      {
         VipModel.ins.currentDiamond = param1.dimond;
      }
      
      private function cplHandler(param1:VipGetFirstChargeRes) : void
      {
         if(param1.firstCharge)
         {
            if(param1.reward)
            {
               this.btn_charge.label = LocaleMgr.ins.getStr(999000234);
               this.btn_charge.disabled = true;
               _status = 3;
               TweenLite.killTweensOf(this.img_light);
               this.img_light.visible = false;
            }
            else
            {
               this.btn_charge.label = LocaleMgr.ins.getStr(999000237);
               this.btn_charge.skin = "png.uiFirstCharge.img_reward";
               _status = 2;
            }
         }
         else
         {
            this.btn_charge.label = LocaleMgr.ins.getStr(999000238);
            _status = 1;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["refreshFirstCharge"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("refreshFirstCharge" === _loc3_)
         {
            cplHandler(param2 as VipGetFirstChargeRes);
         }
      }
   }
}
