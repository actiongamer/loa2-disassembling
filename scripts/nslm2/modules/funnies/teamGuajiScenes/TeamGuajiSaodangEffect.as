package nslm2.modules.funnies.teamGuajiScenes
{
   import morn.core.components.Label;
   import nslm2.utils.ServerTimer;
   
   public class TeamGuajiSaodangEffect
   {
       
      
      public var startTime:uint;
      
      public var delay:uint = 1000;
      
      private var dotStr:String;
      
      public var txt:Label;
      
      private var txtStr:String;
      
      public function TeamGuajiSaodangEffect(param1:Label)
      {
         super();
         this.txt = param1;
      }
      
      public function start(param1:uint, param2:String) : void
      {
         txtStr = param2;
         startTime = param1;
         App.timer.doLoop(delay,onLoop);
         onLoop();
      }
      
      private function onLoop() : void
      {
         var _loc1_:int = ServerTimer.ins.second - this.startTime;
         var _loc2_:* = _loc1_ % 4;
         if(0 !== _loc2_)
         {
            if(1 !== _loc2_)
            {
               if(2 !== _loc2_)
               {
                  if(3 !== _loc2_)
                  {
                     if(4 !== _loc2_)
                     {
                        if(5 !== _loc2_)
                        {
                           if(6 === _loc2_)
                           {
                              txt.text = txtStr + "......";
                           }
                        }
                        else
                        {
                           txt.text = txtStr + ".....";
                        }
                     }
                     else
                     {
                        txt.text = txtStr + "....";
                     }
                  }
                  else
                  {
                     txt.text = txtStr + "...";
                  }
               }
               else
               {
                  txt.text = txtStr + "..";
               }
            }
            else
            {
               txt.text = txtStr + ".";
            }
         }
         else
         {
            txt.text = txtStr;
         }
      }
      
      public function stop() : void
      {
         App.timer.clearTimer(this.onLoop);
      }
      
      public function dispose() : void
      {
         txt = null;
         App.timer.clearTimer(this.onLoop);
      }
   }
}
