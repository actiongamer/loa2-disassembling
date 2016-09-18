package org.specter3d.geom
{
   public class Node
   {
       
      
      public var v:org.specter3d.geom.Vector2f;
      
      public var i:Boolean;
      
      public var p:Boolean = false;
      
      public var o:Boolean = false;
      
      public var other:org.specter3d.geom.Node;
      
      public var isMain:Boolean;
      
      public var next:org.specter3d.geom.Node;
      
      public function Node(param1:org.specter3d.geom.Vector2f, param2:Boolean, param3:Boolean)
      {
         super();
         this.v = param1;
         this.i = param2;
         this.isMain = param3;
      }
      
      public function toString() : String
      {
         return v.toString() + "-->交点：" + i + "出点：" + o + "主：" + isMain + "处理：" + p;
      }
   }
}
