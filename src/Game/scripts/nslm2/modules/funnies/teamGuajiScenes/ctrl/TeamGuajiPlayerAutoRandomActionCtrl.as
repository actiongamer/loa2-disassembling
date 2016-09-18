package nslm2.modules.funnies.teamGuajiScenes.ctrl
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.funnies.teamGuajiScenes.team.TeamMemberPlayer;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import org.specter3d.utils.RandomUtil;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class TeamGuajiPlayerAutoRandomActionCtrl implements IDispose
   {
      
      public static const RUN_MAX_X:int = 280000;
      
      public static const RUN_MIN_X:int = 40000;
      
      public static const RUN_MAX_Y:int = 180000;
      
      public static const RUN_MIN_Y:int = 20000;
       
      
      private var unit3D:TeamMemberPlayer;
      
      private var scene:Scene45Base;
      
      private var _playing:Boolean = true;
      
      public var actionList:Array;
      
      private var posx:int;
      
      private var posy:int;
      
      public function TeamGuajiPlayerAutoRandomActionCtrl(param1:TeamMemberPlayer = null, param2:Scene45Base = null, param3:Array = null)
      {
         actionList = ["std_3","win"];
         super();
         if(param1)
         {
            bind(param1,param2);
         }
      }
      
      public function get playing() : Boolean
      {
         return _playing;
      }
      
      public function set playing(param1:Boolean) : void
      {
         if(_playing != param1)
         {
            _playing = param1;
         }
      }
      
      public function bind(param1:TeamMemberPlayer, param2:Scene45Base) : void
      {
         this.unit3D = param1;
         this.scene = param2;
      }
      
      private function onLoop() : void
      {
         if(!_playing)
         {
            return;
         }
         if(!unit3D)
         {
            return;
         }
         posx = RandomUtil.getBetween(40000,280000) / 100;
         posy = RandomUtil.getBetween(20000,180000) / 100;
         this.unit3D.run(posx,posy,runToHanler);
      }
      
      private function runToHanler() : void
      {
         if(!_playing)
         {
            return;
         }
         var _loc1_:int = RandomUtil.getBetween(3,10);
         TweenLite.delayedCall(_loc1_,onLoop);
      }
      
      public function start() : void
      {
         _playing = true;
         onLoop();
      }
      
      public function stop() : void
      {
         if(unit3D)
         {
            unit3D.stop();
         }
         _playing = false;
      }
      
      private function runToHandler() : void
      {
         if(unit3D)
         {
            unit3D.player.tag3DVBox.showGuajiSaoDang(LocaleMgr.ins.getStr(999000460),16723968);
         }
      }
      
      public function dispose() : void
      {
         unit3D = null;
         playing = false;
         TweenLite.killDelayedCallsTo(onLoop);
      }
   }
}
