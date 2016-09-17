package nslm2.modules.battles.resourceDungeons
{
   import com.mz.core.utils2.task.TaskPool;
   import flash.display.DisplayObjectContainer;
   import flash.geom.Point;
   import nslm2.common.vo.WealthVo;
   
   public class GainEffList extends TaskPool
   {
       
      
      public var parent:DisplayObjectContainer;
      
      public var from:Point;
      
      public var to:Point;
      
      public var vo:WealthVo;
      
      public var count:int;
      
      public var totalGain:int;
      
      public function GainEffList()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = count;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new GainEff();
            _loc1_.delay = 0.2 * _loc3_ + 0.05;
            _loc1_.parent = this.parent;
            _loc1_.vo = this.vo;
            _loc1_.gain = totalGain / count;
            _loc1_.from = this.from;
            _loc1_.to = this.to;
            this.addTask(_loc1_);
            _loc3_++;
         }
         super.exec();
      }
   }
}
