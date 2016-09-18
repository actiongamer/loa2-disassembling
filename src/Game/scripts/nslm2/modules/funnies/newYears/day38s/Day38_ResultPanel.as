package nslm2.modules.funnies.newYears.day38s
{
   import game.ui.newYears.day38s.Day38_ResultPanelUI;
   import nslm2.modules.funnies.newYears.day38s.services.Day38Service;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.modules.scenes.commons.UIUnit3DS2;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.context.AppGlobalContext;
   import nslm2.nets.sockets.ServerEngine;
   import proto.GoddessShowPanelRes;
   import nslm2.nets.sockets.ServerEvent;
   import nslm2.utils.RTools;
   import org.specter3d.loaders.ResourceVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class Day38_ResultPanel extends Day38_ResultPanelUI
   {
       
      
      private var img:Image3D;
      
      private var avatar:UIUnit3DS2;
      
      private var showId:int;
      
      private const bg_url:String = "img/day38_img_bg.png";
      
      public function Day38_ResultPanel()
      {
         avatar = new UIUnit3DS2();
         super();
         this.btn_close.clickHandler = closeHandler;
         this.moduleFadeInType = 0;
         this.txt_tip1.text = LocaleMgr.ins.getStr(13333013);
         this.txt_tip2.text = LocaleMgr.ins.getStr(13333014);
         this.txt_tip3.text = LocaleMgr.ins.getStr(13333015);
      }
      
      public function get service() : Day38Service
      {
         return Day38Service.ins;
      }
      
      public function get layer3D() : ObjectContainer3D
      {
         return AppGlobalContext.stage3d.view3d2Layer3D;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(param1 != null)
         {
            showId = param1;
            super.moduleServerStart(null);
         }
         else
         {
            ServerEngine.ins.send(6261,null,server_showPanel_cpl);
         }
      }
      
      private function server_showPanel_cpl(param1:GoddessShowPanelRes, param2:ServerEvent) : void
      {
         showId = param1.goddessId;
         this.txt_tip3.text = RTools.getStrByJSON(param1.winWord);
         super.moduleServerStart(null);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         AppGlobalContext.asynLoader.loadOne(new ResourceVo("img/day38_img_bg.png"),img_bg_loadCpl);
         this.createAvatar3D(showId);
      }
      
      private function img_bg_loadCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         img = new Image3D("img/day38_img_bg.png",0,0,1000,false,true);
         img.x = 0;
         img.y = 0;
         this.txt_name.text = LocaleMgr.ins.getStr(int(StcMgr.ins.getNpcVo(this.showId).name));
         super.preShow();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         AppGlobalContext.stage3d.view3d2.mouseChildren = true;
         AppGlobalContext.stage3d.view3d2.mouseEnabled = true;
         this.layer3D.addChild(img);
         this.layer3D.addChild(avatar);
         avatar.mouseChildren = false;
         avatar.mouseEnabled = false;
         avatar.x = 0;
         avatar.y = -180;
         ModuleMgr.ins.staticLayer.switchVisible("first_charge",false);
         ModuleMgr.ins.sceneLayer.switchVisible("first_charge",false);
      }
      
      private function createAvatar3D(param1:*) : void
      {
         if(this.avatar)
         {
            this.avatar.visible = true;
            this.avatar.initByStcNpcId(param1);
            this.avatar.rotation = -90;
         }
      }
      
      private function closeHandler() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.switchVisible("first_charge",true);
         ModuleMgr.ins.sceneLayer.switchVisible("first_charge",true);
         AppGlobalContext.stage3d.view3d2.mouseChildren = false;
         AppGlobalContext.stage3d.view3d2.mouseEnabled = false;
         if(img)
         {
            img.dispose();
         }
         if(avatar)
         {
            avatar.dispose();
         }
         super.preClose(param1);
      }
   }
}
