const canvas = document.getElementById('game');
const ctx = canvas.getContext('2d');

const gridSize = 20;
const tileCount = canvas.width / gridSize;

let snake = [{ x: 10, y: 10 }];
let apple = { x: 5, y: 5 };
let dx = 1;
let dy = 0;
let paused = true;

function gameLoop() {
  if (paused) {
    drawGame(true); // narysuj planszę z napisem PAUZA
    return;
  }

  const head = { x: snake[0].x + dx, y: snake[0].y + dy };

  // Kolizja ze ścianą lub sobą
  if (
    head.x < 0 || head.x >= tileCount ||
    head.y < 0 || head.y >= tileCount ||
    snake.some(s => s.x === head.x && s.y === head.y)
  ) {
    alert("Game Over!");
    snake = [{ x: 10, y: 10 }];
    dx = 1; dy = 0;
    apple = { x: 5, y: 5 };
    return;
  }

  snake.unshift(head);
  if (head.x === apple.x && head.y === apple.y) {
    apple = {
      x: Math.floor(Math.random() * tileCount),
      y: Math.floor(Math.random() * tileCount)
    };
  } else {
    snake.pop();
  }

  drawGame();
}

function drawGame(showPause = false) {
  ctx.fillStyle = '#222';
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  // Rysuj jabłko
  ctx.fillStyle = 'red';
  ctx.fillRect(apple.x * gridSize, apple.y * gridSize, gridSize, gridSize);

  // Rysuj węża
  ctx.fillStyle = 'lime';
  for (let s of snake) {
    ctx.fillRect(s.x * gridSize, s.y * gridSize, gridSize - 2, gridSize - 2);
  }

  if (showPause) {
    ctx.fillStyle = 'white';
    ctx.font = '28px Arial';
    ctx.textAlign = 'center';
    ctx.fillText('PAUZA WCISNIJ SPACJE', canvas.width / 2, canvas.height / 2);
  }
}

document.addEventListener('keydown', e => {
  switch (e.key) {
    case 'ArrowUp':
      if (dy !== 1) { dx = 0; dy = -1; }
      break;
    case 'ArrowDown':
      if (dy !== -1) { dx = 0; dy = 1; }
      break;
    case 'ArrowLeft':
      if (dx !== 1) { dx = -1; dy = 0; }
      break;
    case 'ArrowRight':
      if (dx !== -1) { dx = 1; dy = 0; }
      break;
    case ' ':
      paused = !paused; // Przełącz pauzę
      break;
  }
});

setInterval(gameLoop, 150);
