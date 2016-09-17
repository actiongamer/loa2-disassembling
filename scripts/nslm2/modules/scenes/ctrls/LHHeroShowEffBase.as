package nslm2.modules.scenes.ctrls
{
   import com.mz.core.utils2.task.TaskBase;
   import away3d.containers.ObjectContainer3D;
   import flash.geom.Point;
   import nslm2.modules.scenes.commons.SceneUnit3D;
   import nslm2.modules.battles.battle.FPUtil;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.utils.TransformUtil;
   import org.specter3d.display.particle.SpecterEffect;
   
   public class LHHeroShowEffBase extends TaskBase
   {
       
      
      public var parent:ObjectContainer3D;
      
      public var xy:Point;
      
      public var unit3D:SceneUnit3D;
      
      public var isOneLottery:Boolean;
      
      protected var effPrepare:SpecterEffect;
      
      public function LHHeroShowEffBase(param1:ObjectContainer3D, param2:Point, param3:Boolean)
      {
         super();
         this.parent = param1;
         this.xy = param2;
         this.createEffPrepare();
         this.isOneLottery = param3;
      }
      
      public function addDark() : void
      {
         if(this.unit3D)
         {
            this.unit3D.tag3DVBox.visible = false;
            this.unit3D.avatar.addMethod(FPUtil.getDarkMethod4());
         }
         if(effPrepare)
         {
            effPrepare.visible = false;
         }
      }
      
      override public function exec() : void
      {
         super.exec();
         disposeEffPrepare();
      }
      
      public function removeDark() : void
      {
         if(this.unit3D)
         {
            this.unit3D.tag3DVBox.visible = true;
            this.unit3D.avatar.removeMethod(FPUtil.getDarkMethod4());
         }
         if(effPrepare)
         {
            effPrepare.visible = true;
         }
      }
      
      protected function createEffPrepare() : void
      {
         effPrepare = EffectManager.createEffect(Effect3DUtils.getUrlBySid(12105),true,parent);
         effPrepare.scaleAll = 1.8;
         effPrepare.position = TransformUtil.tran2DTo3D(xy.x,xy.y);
      }
      
      protected function disposeEffPrepare() : void
      {
         if(this.effPrepare)
         {
            effPrepare.dispose();
            effPrepare = null;
         }
      }
      
      override public function dispose() : void
      {
         disposeEffPrepare();
         super.dispose();
      }
   }
}
