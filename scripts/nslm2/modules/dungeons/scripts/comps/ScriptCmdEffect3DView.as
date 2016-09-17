package nslm2.modules.dungeons.scripts.comps
{
   import com.mz.core.interFace.IDispose;
   import org.specter3d.display.particle.SpecterEffect;
   import nslm2.utils.TransformUtil;
   import away3d.containers.ObjectContainer3D;
   import org.specter3d.display.particle.EffectManager;
   
   public class ScriptCmdEffect3DView implements IDispose
   {
       
      
      public var eff:SpecterEffect;
      
      private var _x:int;
      
      private var _y:int;
      
      public function ScriptCmdEffect3DView(param1:String, param2:ObjectContainer3D)
      {
         super();
         eff = EffectManager.createEffect(param1,true,param2);
      }
      
      public function dispose() : void
      {
         if(eff)
         {
            eff.dispose();
            eff = null;
         }
      }
      
      public function get x() : int
      {
         return _x;
      }
      
      public function set x(param1:int) : void
      {
         _x = param1;
         eff.position = TransformUtil.fight2Dto3D(x,y);
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set y(param1:int) : void
      {
         _y = param1;
         eff.position = TransformUtil.fight2Dto3D(x,y);
      }
   }
}
