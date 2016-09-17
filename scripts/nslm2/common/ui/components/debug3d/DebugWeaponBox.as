package nslm2.common.ui.components.debug3d
{
   import morn.core.components.VBox;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import morn.core.components.Tab;
   import nslm2.utils.ConfigUtil;
   import flash.system.System;
   import com.mz.core.logging.Log;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   
   public class DebugWeaponBox extends VBox
   {
      
      public static const GLOSS:String = "gloss";
      
      public static const KEY:String = "weaponUI";
       
      
      private var panel3D:UIPanel3D;
      
      private var weapon3D:UIWeapon3D;
      
      public var debug_gloss:nslm2.common.ui.components.debug3d.Param3DRender;
      
      private var weapon3dDebug:nslm2.common.ui.components.debug3d.Object3DParams;
      
      private var effDebug:nslm2.common.ui.components.debug3d.Object3DParams;
      
      private var cb_useBloom:nslm2.common.ui.components.debug3d.DebugBooleanParamRender;
      
      private var debug_bloom:nslm2.common.ui.components.debug3d.DebugBloomFilterBox;
      
      private var tab:Tab;
      
      public function DebugWeaponBox(param1:UIPanel3D)
      {
         super();
         this.panel3D = param1;
         tab = new Tab("0,1导出,2特效调节,3导出特效","png.comp.tab");
         tab.userChangeHandler = tab_changeHandler;
         this.addChild(tab);
         weapon3dDebug = new nslm2.common.ui.components.debug3d.Object3DParams("weapon");
         this.addChild(new nslm2.common.ui.components.debug3d.Object3DParams("weapon"));
         debug_gloss = new nslm2.common.ui.components.debug3d.Param3DRender();
         debug_gloss.paramType = "position";
         this.addChild(debug_gloss);
         cb_useBloom = new nslm2.common.ui.components.debug3d.DebugBooleanParamRender();
         cb_useBloom.bind(panel3D,"useBloom");
         this.addChild(cb_useBloom);
         debug_bloom = new nslm2.common.ui.components.debug3d.DebugBloomFilterBox();
         debug_bloom.bind(panel3D.bloomFilter);
         this.addChild(debug_bloom);
         this.addChild(panel3D.lightCtrl.debugBox);
         ModuleMgr.ins.debugBox.addChild(this);
      }
      
      public function bindWeapon(param1:UIWeapon3D) : void
      {
         this.weapon3D = param1;
         this.weapon3dDebug.bind(param1);
         param1.debug_gloss = this.debug_gloss;
      }
      
      private function tab_changeHandler(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(int(param1))
         {
            case 0:
               break;
            case 1:
               _loc4_ = {};
               _loc4_["transform"] = ConfigUtil.toTransfrom(this.weapon3D);
               _loc2_ = {};
               _loc2_["weaponUI"] = _loc4_;
               _loc3_ = JSON.stringify(_loc2_);
               System.setClipboard(_loc3_);
               Log.debug(this,"导出数据:",_loc3_);
               AlertUtil.float("导出数据已经保存到剪贴板");
               break;
            case 2:
               if(effDebug == null)
               {
                  effDebug = new nslm2.common.ui.components.debug3d.Object3DParams("eff");
                  this.addChild(effDebug);
               }
               effDebug.bind(this.weapon3D.eff);
            default:
               if(effDebug == null)
               {
                  effDebug = new nslm2.common.ui.components.debug3d.Object3DParams("eff");
                  this.addChild(effDebug);
               }
               effDebug.bind(this.weapon3D.eff);
         }
         tab.selectedIndex = 0;
      }
   }
}
