package nslm2.modules.foundations.vip
{
   import game.ui.vipModule.VipModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import flash.display.Sprite;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.common.ui.components.debug3d.DebugWeaponBox;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.vip.model.VipModel;
   import flash.events.MouseEvent;
   import nslm2.common.globals.GlobalRef;
   import nslm2.modules.foundations.vip.view.VipGreatGiftView;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl3;
   import nslm2.common.vo.WealthVo;
   import morn.core.components.Image;
   import nslm2.common.model.PlayerModel;
   import com.greensock.TweenLite;
   import flash.geom.Point;
   import com.greensock.easing.Cubic;
   import nslm2.modules.foundations.vip.service.VipService;
   import proto.GetVipInfoRes;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.Event;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DWinActionCtrl;
   import away3d.events.MouseEvent3D;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.foundations.vip.view.VipPrivilegesView;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Panel;
   import morn.core.handlers.Handler;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.ConfigUtil;
   import flash.geom.Vector3D;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   
   public class VipModule extends VipModuleUI implements INewerGuideCheckHandler
   {
       
      
      private var vs:ViewStack;
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var avatar2:UIUnit3D;
      
      private var avatar3:UIUnit3D;
      
      private const PROCESS_LIGHT_START_X:int = 248;
      
      private const PROCESS_LIGHT_END_X:int = 560;
      
      private var avatarScaleHash:Object;
      
      private var chargeBg:Sprite;
      
      private var weapon3d:UIWeapon3D;
      
      private var weapon3d2:UIWeapon3D;
      
      public var debugWeaponBox:DebugWeaponBox;
      
      private var eff_gold:BmcSpriteSheet;
      
      private var times:int;
      
      private var prevIndex:int = 0;
      
      private var model:VipModel;
      
      private const AVATAR_SCALE:Number = 1;
      
      private const CHEST_SCALE:Number = 0.7;
      
      private const WEAPON_SCALE:Number = 0.88;
      
      private var WEAPON_ARR:Array;
      
      private var light_ctrl:LightAndShadowCtrl3;
      
      private var panel:Panel;
      
      public function VipModule()
      {
         WEAPON_ARR = [1,3,2,4,8,9];
         super();
         vs = new ViewStack();
         vs.x = 16;
         vs.y = 149;
         addChild(vs);
         this.panelBg.img_rim.skin = "png.uiVip.框";
         this.panelBg.img_rim.sizeGrid = "0,0,0,0";
         this.panelBg.img_rimBg.skin = "png.uiVip.大底";
         this.panelBg.img_rimBg.sizeGrid = "28,0,28,0";
         this.removeChild(this.img_funBg);
         img_funBg.y = img_funBg.y + 5;
         this.btn_charge.addEventListener("click",chargeClick);
      }
      
      public function chargeClick(param1:MouseEvent = null) : void
      {
         VipModel.ins.gotoCharge();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         GlobalRef.needShowVip = false;
         vs.addItem(new VipGreatGiftView());
         this.panelBg.bgCustom.addChild(this.img_funBg);
         this.panelBg.img_rim.x = this.panelBg.img_rim.x - 20;
         this.panelBg.img_rim.y = this.panelBg.img_rim.y - 54;
         this.panelBg.img_rimBg.top = 8;
         this.panelBg.img_rimBg.bottom = 65;
         this.panelBg.img_rimBg.left = -16;
         this.panelBg.img_rimBg.right = 19;
         this.panelBg.img_titleBg.visible = false;
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(0,1);
         _loc3_.graphics.drawRoundRect(this.panelBg.img_rimBg.x,this.panelBg.img_rimBg.y,this.panelBg.img_rimBg.width,this.panelBg.img_rimBg.height,15,15);
         addChild(_loc3_);
         this.panelBg.img_rimBg.mask = _loc3_;
         this.removeChild(this.img_grid);
         img_grid.mouseEnabled = false;
         DisplayUtils.addChildBelow(this.img_grid,this.panelBg.img_rim);
         vs.selectedIndex = 0;
         tabBar.labels = LocaleMgr.ins.getStr(998000829);
         tabBar.selectHandler = selectHandler;
         panel3D = new UIPanel3D(this);
         light_ctrl = new LightAndShadowCtrl3(panel3D.layer3D);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         avatar.useBigTex = true;
         panel3D.addChild3D(avatar);
         var _loc5_:int = 1;
         var _loc7_:int = 0;
         var _loc6_:* = (vs.selection as VipGreatGiftView).list_gift.array;
         for each(var _loc4_ in (vs.selection as VipGreatGiftView).list_gift.array)
         {
            if(_loc4_.stcItemVo || _loc4_.stcNpcVo)
            {
               update3D(_loc4_,_loc5_);
               _loc5_++;
            }
         }
         var _loc2_:Image = new Image();
         _loc2_.url = "png.uiVip.上底部";
         _loc2_.x = 10;
         _loc2_.y = 23;
         DisplayUtils.addChildAbove(_loc2_,this.panelBg.img_rimBg);
         this.process_bar.value = 0;
         this.img_spot.x = 248;
         updateProcess(PlayerModel.ins.vip);
         if(param1 as int == 2)
         {
            chargeClick(null);
         }
         super.preShow(param1);
      }
      
      private function updateProcess(param1:int = -1) : void
      {
         model = VipModel.ins;
         var _loc4_:int = model.getDiamondPrice(model.getVipValue(10000,param1 > 0?param1 + 1:Number(PlayerModel.ins.vip + 1)));
         var _loc3_:int = model.getDiamondPrice(model.getVipValue(10000,param1 > 0?param1:int(PlayerModel.ins.vip)));
         var _loc2_:Number = model.currentDiamond / _loc4_ > 1?1:Number(model.currentDiamond / _loc4_);
         TweenLite.to(this.process_bar,_loc2_,{"value":_loc2_});
         TweenLite.to(this.img_spot,_loc2_,{"x":248 + _loc2_ * (560 - 248)});
         this.current_vip.value = PlayerModel.ins.vip;
         this.next_vip.value = param1 > 0?param1 + 1:Number(PlayerModel.ins.vip + 1);
         if(this.next_vip.value > 15)
         {
            this.next_vip.value = 15;
         }
         if(model.currentDiamond <= _loc4_ || current_vip.value == 15)
         {
            this.txt_process.text = model.currentDiamond + "/" + _loc4_;
         }
         else
         {
            this.txt_process.text = _loc4_ + "/" + _loc4_;
         }
         this.txt_title.text = LocaleMgr.ins.getStr(108000001,[_loc4_ - model.currentDiamond > 0?_loc4_ - model.currentDiamond:0]);
      }
      
      private function createAvatar3D(param1:uint, param2:UIUnit3D, param3:int) : void
      {
         var _loc4_:* = null;
         if(param2)
         {
            param2.initByStcNpcId(param1);
            _loc4_ = new Point(-240 + 240 * (param3 - 1),-this.img_funBg.height / 2 + 80);
            param2.pos2d = _loc4_;
            this.avatar.rotation = -90;
            param2.addEventListener("mouseOver3d",mouseOver);
            param2.addEventListener("mouseOut3d",mouseOut);
            param2.box3D2.scaleAll = 1;
            TweenLite.from(param2,0.6,{
               "x":-500,
               "ease":Cubic.easeOut
            });
            panel3D.useBloom = false;
            if(panel3D.lightCtrl)
            {
               panel3D.lightCtrl = null;
            }
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         VipService.ins.getCurrentDiamond(cplHandler);
      }
      
      private function cplHandler(param1:GetVipInfoRes) : void
      {
         VipModel.ins.currentDiamond = param1.dimond;
         VipModel.ins.buyStatusArr = [];
         var _loc4_:int = 0;
         var _loc3_:* = param1.rewardGot;
         for each(var _loc2_ in param1.rewardGot)
         {
            VipModel.ins.buyStatusArr.push(_loc2_);
         }
         ObserverMgr.ins.sendNotice("refreshHeaderRedPoint");
         super.moduleServerStart(null);
      }
      
      private function mouseClick(param1:Event) : void
      {
      }
      
      private function mouseOver(param1:MouseEvent3D) : void
      {
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo((param1.target as UIUnit3D).stcNpcId);
         ObserverMgr.ins.sendNotice("msg_tooltip_show",_loc2_);
      }
      
      private function mouseOut(param1:MouseEvent3D) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         vs.addItem(new VipPrivilegesView());
         if(tabBar.selectedIndex == 0)
         {
            panel3D.visible = true;
         }
         else
         {
            panel3D.visible = false;
         }
         var _loc2_:String = param1 as String;
         if(_loc2_ == "VipPrivilegesView")
         {
            tabBar.selectedIndex = 1;
            vs.selectedIndex = 1;
         }
         NGUtil.checkModuleShow(this.moduleId);
      }
      
      private function selectHandler(param1:int) : void
      {
         vs.selectedIndex = tabBar.selectedIndex;
         if(tabBar.selectedIndex == 0)
         {
            panel3D.visible = true;
         }
         else
         {
            panel3D.visible = false;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["vip_update_3d_model","vip_update_progress","PLAYER_VIP_UP"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = param1;
         if("vip_update_3d_model" !== _loc7_)
         {
            if("vip_update_progress" !== _loc7_)
            {
               if("MSG_GM_CMD" !== _loc7_)
               {
                  if("PLAYER_VIP_UP" === _loc7_)
                  {
                     times = param2 as int;
                     _loc3_ = vs.selection as VipGreatGiftView;
                     if(_loc3_)
                     {
                        _loc3_.updateBuyBtn();
                     }
                     if(times > 0)
                     {
                        process();
                     }
                     else
                     {
                        updateProcess();
                     }
                  }
               }
               else if(param2 == "debug3d")
               {
                  if(debugWeaponBox == null)
                  {
                     debugWeaponBox = new DebugWeaponBox(this.panel3D);
                     debugWeaponBox.bindWeapon(weapon3d);
                  }
               }
            }
            else
            {
               this.updateProcess(param2 as int);
            }
         }
         else
         {
            _loc5_ = 1;
            _loc7_ = 0;
            var _loc6_:* = (vs.selection as VipGreatGiftView).list_gift.array;
            for each(var _loc4_ in (vs.selection as VipGreatGiftView).list_gift.array)
            {
               if(_loc4_.stcItemVo || _loc4_.stcNpcVo)
               {
                  update3D(_loc4_,_loc5_);
                  _loc5_++;
               }
            }
         }
      }
      
      private function update3D(param1:WealthVo, param2:int = 1) : void
      {
         if(param1.stcNpcVo)
         {
            if(weapon3d)
            {
               weapon3d.visible = false;
            }
            if(weapon3d2)
            {
               weapon3d2.visible = false;
            }
            if(avatar)
            {
               avatar.visible = true;
               panel3D.useBloom = false;
               if(panel3D.lightCtrl)
               {
                  panel3D.lightCtrl = null;
               }
               avatar.mouseEnabled = true;
               avatar.mouseChildren = true;
            }
            this.createAvatar3D(param1.stcNpcVo.id,avatar,2);
         }
         else if(param1.stcItemVo)
         {
            if(param1.stcItemVo.kind != 97 && WEAPON_ARR.indexOf(param1.stcItemVo.kind) != -1)
            {
               if(param2 != 1 && avatar.visible && avatar2.visible && avatar3.visible)
               {
                  return;
               }
               if(avatar)
               {
                  avatar.visible = false;
               }
               if(avatar2)
               {
                  avatar2.visible = false;
               }
               if(avatar3)
               {
                  avatar3.visible = false;
               }
               if(weapon3d)
               {
                  weapon3d.visible = true;
                  if(!panel3D.lightCtrl)
                  {
                     panel3D.lightCtrl = light_ctrl;
                  }
               }
               if(weapon3d2)
               {
                  weapon3d2.visible = false;
               }
               if(param2 == 1)
               {
                  if(weapon3d != null)
                  {
                     disposeWeapon(weapon3d);
                  }
                  weapon3d = new UIWeapon3D();
                  this.changeEquipModel(weapon3d,param1.stcItemVo.show_id,param1.stcItemVo.kind,UIWeapon3D.getEffId(param1.stcItemVo,3));
                  TweenLite.from(weapon3d,0.6,{
                     "x":-500,
                     "ease":Cubic.easeOut
                  });
               }
               else
               {
                  if(weapon3d2 != null)
                  {
                     disposeWeapon(weapon3d2);
                  }
                  weapon3d2 = new UIWeapon3D();
                  this.changeEquipModel(weapon3d2,param1.stcItemVo.show_id,param1.stcItemVo.kind,UIWeapon3D.getEffId(param1.stcItemVo,3));
                  TweenLite.killTweensOf(weapon3d);
                  changeWeaponPos();
                  if(weapon3d)
                  {
                     TweenLite.from(weapon3d,0.6,{
                        "x":-500,
                        "ease":Cubic.easeOut
                     });
                  }
                  TweenLite.from(weapon3d2,0.6,{
                     "x":-500,
                     "ease":Cubic.easeOut
                  });
               }
            }
            else if(param1.stcItemVo.kind == 97)
            {
               if(avatar)
               {
                  avatar.visible = true;
                  panel3D.useBloom = false;
                  if(panel3D.lightCtrl)
                  {
                     panel3D.lightCtrl = null;
                  }
                  avatar.mouseEnabled = true;
                  avatar.mouseChildren = true;
                  this.createAvatar3D(param1.stcItemVo.extend_1.split("|")[1],avatar,2);
               }
               if(weapon3d)
               {
                  weapon3d.visible = false;
               }
               if(weapon3d2)
               {
                  weapon3d2.visible = false;
               }
               if(avatar2)
               {
                  avatar2.visible = true;
                  this.createAvatar3D(param1.stcItemVo.extend_1.split("|")[0],avatar2,1);
               }
               else
               {
                  avatar2 = new UIUnit3D();
                  this.createAvatar3D(param1.stcItemVo.extend_1.split("|")[0],avatar2,1);
                  panel3D.addChild3D(avatar2);
               }
               if(avatar3)
               {
                  avatar3.visible = true;
                  this.createAvatar3D(param1.stcItemVo.extend_1.split("|")[2],avatar3,3);
               }
               else
               {
                  avatar3 = new UIUnit3D();
                  this.createAvatar3D(param1.stcItemVo.extend_1.split("|")[2],avatar3,3);
                  panel3D.addChild3D(avatar3);
               }
            }
            else if(param2 == 1 && param1.stcItemVo.kind == 26)
            {
               if(avatar)
               {
                  avatar.visible = true;
                  panel3D.useBloom = false;
                  if(panel3D.lightCtrl)
                  {
                     panel3D.lightCtrl = null;
                  }
                  avatar.actStd = "std_3";
                  avatar.mouseEnabled = false;
                  avatar.mouseChildren = false;
                  avatar.initByModelId(30002);
                  avatar.box3D2.scaleAll = 0.7;
                  avatar.y2d = -80;
                  TweenLite.from(avatar,0.6,{
                     "x":-500,
                     "ease":Cubic.easeOut
                  });
               }
               if(avatar2)
               {
                  avatar2.visible = false;
               }
               if(avatar3)
               {
                  avatar3.visible = false;
               }
            }
         }
      }
      
      private function changeWeaponPos() : void
      {
         if(weapon3d)
         {
            if((vs.selection as VipGreatGiftView).list_gift.array[0].stcItemVo.kind == 1)
            {
               weapon3d.x = -250;
            }
            else
            {
               weapon3d.x = -150;
            }
         }
         weapon3d2.x = 150;
      }
      
      private function process(param1:Boolean = false) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(times > 0)
         {
            if(param1)
            {
               this.process_bar.value = 0;
               this.img_spot.x = 248;
               this.current_vip.value = this.current_vip.value + 1;
               this.next_vip.value = this.next_vip.value + 1;
               _loc3_ = model.getDiamondPrice(model.getVipValue(10000,this.current_vip.value > 0?this.current_vip.value + 1:Number(PlayerModel.ins.vip + 1)));
               _loc2_ = model.getDiamondPrice(model.getVipValue(10000,this.current_vip.value > 0?this.current_vip.value:PlayerModel.ins.vip));
               if(model.currentDiamond <= _loc3_)
               {
                  this.txt_process.text = model.currentDiamond + "/" + _loc3_;
               }
               else
               {
                  this.txt_process.text = _loc3_ + "/" + _loc3_;
               }
               this.txt_title.text = LocaleMgr.ins.getStr(108000001,[_loc3_ - model.currentDiamond > 0?_loc3_ - model.currentDiamond:0]);
            }
            TweenLite.to(this.process_bar,0.2,{"value":1});
            TweenLite.to(this.img_spot,0.2,{"x":560});
            playEff();
         }
         else
         {
            this.process_bar.value = 0;
            this.img_spot.x = 248;
            updateProcess();
         }
      }
      
      private function playEff() : void
      {
         eff_gold = new BmcSpriteSheet();
         eff_gold.x = process_bar.x - 65;
         eff_gold.y = process_bar.y - 100;
         if(times > 0)
         {
            times = Number(times) - 1;
            eff_gold.init(10800001,1,"all",false,1,0,new Handler(process,[true]));
         }
         DisplayUtils.addChildAbove(eff_gold,this.process_bar);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(panel3D)
         {
            panel3D.dispose();
            panel3D = null;
         }
         if(avatar)
         {
            avatar.dispose();
            avatar = null;
         }
         if(weapon3d)
         {
            weapon3d.dispose();
            weapon3d = null;
         }
         super.preClose(param1);
      }
      
      private function disposeWeapon(param1:UIWeapon3D) : void
      {
         TweenLite.killTweensOf(param1);
         param1.dispose();
      }
      
      private function changeEquipModel(param1:UIWeapon3D, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:* = null;
         if(param2 != 0)
         {
            if(!panel3D.lightCtrl)
            {
               panel3D.lightCtrl = light_ctrl;
            }
            _loc5_ = StcMgr.ins.getModelVo(param2);
            if(_loc5_ && StringUtils.isNull(_loc5_.extra) == false)
            {
               ConfigUtil.setWeaponUIExtra(param1,_loc5_.extra);
            }
            else
            {
               param1.position = new Vector3D(0,-40,0);
               param1.scaleAll = 1.21;
            }
            switch(int(param3) - 1)
            {
               case 0:
                  param1.position = new Vector3D(-119,-84,0);
                  param1.eulers = new Vector3D(0,0,-36);
                  param1.scaleAll = 1.81 * 0.88;
                  break;
               case 1:
                  param1.position = new Vector3D(0,-80,0);
                  param1.eulers = new Vector3D(0,0,0);
                  param1.scaleAll = 1.75 * 0.88;
                  break;
               case 2:
                  param1.position = new Vector3D(0,-39,0);
                  param1.eulers = new Vector3D(0,0,0);
                  param1.scaleAll = 2.82 * 0.88;
                  break;
               case 3:
                  param1.position = new Vector3D(0,0,0);
                  param1.eulers = new Vector3D(0,0,0);
                  param1.scaleAll = 2 * 0.88;
            }
            param1.initByModelId(param2);
            if(this.debugWeaponBox)
            {
               debugWeaponBox.bindWeapon(param1);
            }
            panel3D.addChild3D(param1);
            param1.changeEff(_loc5_.effect_id);
         }
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 20031))
         {
            GlobalRef.chapterModuleShowAgainVo = null;
         }
         return 1;
      }
   }
}
