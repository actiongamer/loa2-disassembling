package nslm2.modules.scenes.commons
{
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.TransformUtil;
   import com.mz.core.event.ChangeValueEvent;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.events.Avatar3DEvent;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import away3d.containers.ObjectContainer3D;
   
   public class SceneLotteryHero3D extends SceneUnit3D
   {
       
      
      private var effFoot:SpecterEffect;
      
      public function SceneLotteryHero3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.inUI = true;
         this.useShadow = true;
      }
      
      override protected function avatar_mouseOver3D(param1:Event) : void
      {
         super.avatar_mouseOver3D(param1);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(this.stcNpcId);
         ObserverMgr.ins.sendNotice("msg_tooltip_show",_loc2_);
      }
      
      override protected function avatar_mouseOut3D(param1:Event) : void
      {
         super.avatar_mouseOut3D(param1);
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      override protected function validatePos() : void
      {
         this.position = TransformUtil.tran2DTo3D(this.pos2d.x,this.pos2d.y);
         this.dispatchEvent(new ChangeValueEvent(this.pos2d.clone()));
      }
      
      override protected function avatarAsset_onCpl(param1:Avatar3DEvent) : void
      {
         super.avatarAsset_onCpl(param1);
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(this.stcNpcId);
         if(_loc2_.quality == 4)
         {
            effFoot = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700002),true,this.tag3DBottomBox.boxIngoreRoScale);
         }
         else if(_loc2_.quality == 5)
         {
            effFoot = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700001),true,this.tag3DBottomBox.boxIngoreRoScale);
         }
         if(effFoot)
         {
            effFoot.scaleAll = 2;
         }
      }
      
      override public function dispose() : void
      {
         if(effFoot)
         {
            effFoot.dispose();
            effFoot = null;
         }
         super.dispose();
      }
   }
}
