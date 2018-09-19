<table border="1">

<tr>
    <th>DATE</th>
    <th>USD (buy)</th>
    <th>USD (sale)</th>
    <th>EUR (buy)</th>
    <th>EUR (sale)</th>
   </tr>
<?php foreach ($courses as $course): ?>

        <tr> 
        <td><?php echo $course['date'] ?></td>    
        <td><?php echo $course['usd_buy'] ?></td> <td><?php echo $course['usd_sale'] ?></td>
        <td><?php echo $course['eur_buy'] ?></td> <td><?php echo $course['eur_sale'] ?></td>
        </tr>
        

<?php endforeach; ?>
</table>
<p><a href="<?php echo base_url(); ?>">View home</a></p>


