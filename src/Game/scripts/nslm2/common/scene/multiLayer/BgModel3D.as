package nslm2.common.scene.multiLayer
{
   import com.mz.core.interFace.IDispose;
   import nslm2.common.scene.multiLayer.configs.BgLayerConfigVo;
   import nslm2.modules.fightPlayer.AvatarEquipBody3D;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.scene.multiLayer.configs.BgTransfrom3DVo;
   import flash.events.Event;
   
   public class BgModel3D implements IDispose
   {
       
      
      public var bgLayerConfigVo:BgLayerConfigVo;
      
      public var bgLayer:nslm2.common.scene.multiLayer.BgLayer;
      
      public var avatar:AvatarEquipBody3D;
      
      public function BgModel3D()
      {
         super();
      }
      
      public function init() : void
      {
         var _loc1_:AvatarEquipBody3D = FactoryUtil.add3D(false,StcMgr.ins.getModelVo(bgLayerConfigVo.model3d.id),0,null,1);
         _loc1_.addEventListener("avatar_anim_all_complete",avatar_loadCpl);
         _loc1_.data = bgLayerConfigVo;
         _loc1_.renderLayer = bgLayerConfigVo.model3d.renderLayer;
         BgTransfrom3DVo.setTransfrom(_loc1_,bgLayerConfigVo.model3d.transfrom3d);
         bgLayer.childParent.addChild(_loc1_);
         this.avatar = _loc1_;
      }
      
      private function avatar_loadCpl(param1:Event) : void
      {
         this.avatar.action = bgLayerConfigVo.model3d.action;
      }
      
      public function dispose() : void
      {
         if(avatar)
         {
            avatar.removeEventListener("avatar_anim_all_complete",avatar_loadCpl);
            avatar.dispose();
            avatar = null;
         }
      }
   }
}
