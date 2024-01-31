let slideImages = document.querySelectorAll('.slides img');
let next = document.querySelector('.next');
let prev = document.querySelector('.prev');
let dots = document.querySelectorAll('.dot');

var counter = 0;

//click next
next.addEventListener('click', slideNext);
function slideNext() {
    slideImages[counter].style.animation = 'next1 0.5s ease-in forwards';
    if (counter >= slideImages.length - 1) {
        counter = 0;
    } else {
        counter++;
    }
    slideImages[counter].style.animation = 'next2 0.5s ease-in forwards';
    indicators();
}

//click prev
prev.addEventListener('click', slidePrev);
function slidePrev() {
    slideImages[counter].style.animation = 'prev1 0.5s ease-in forwards';
    if (counter == 0) {
        counter = slideImages.length - 1;
    } else {
        counter--;
    }
    slideImages[counter].style.animation = 'prev2 0.5s ease-in forwards';
    indicators();
}

//auto slide
function autoSliding() {
    deletInterval = setInterval(timer, 5000);
    function timer() {
        slideNext();
        indicators();
    }
}
autoSliding();

//stop auto slide when move mouse
const container = document.querySelector('.slide-container');
container.addEventListener('mouseover', function () {
    clearInterval(deletInterval);
});

//Resume sliding when mouse is out
container.addEventListener('mouseout', autoSliding);

//add and remove active class from the indicators
function indicators() {
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(' active', '');
    }
    dots[counter].className += ' active';
}

//add click event to the indicator
function switchImage(currentImage) {
    currentImage.classList.add('active');
    var imageId = currentImage.getAttribute('attr');
    if (imageId > counter) {
        slideImages[counter].style.animation = 'next1 0.5s ease-in forwards';
        counter = imageId;
        slideImages[counter].style.animation = 'next2 0.5s ease-in forwards';
    } else if (imageId === counter) {
        return;
    } else {
        slideImages[counter].style.animation = 'prev1 0.5s ease-in forwards';
        counter = imageId;
        slideImages[counter].style.animation = 'prev2 0.5s ease-in forwards';
    }
    indicators();
}


const openModelButtons = document.querySelectorAll('[data-model-target]');
const closeModelButtons = document.querySelectorAll('[data-close-button]');
const overlay = document.getElementById('overlay');

openModelButtons.forEach(button => {
    button.addEventListener('click', () => {
        const model = document.querySelector(button.dataset.modelTarget);
        openModel(model);
    });
});

overlay.addEventListener('click', () => {
    const models = document.querySelectorAll('.model.active');
    models.forEach(model => {
        closeModel(model);
    });
});

closeModelButtons.forEach(button => {
    button.addEventListener('click', () => {
        const model = button.closest('.model');
        closeModel(model);
    });
});

function openModel(model) {
    if (model === null)
        return;
    model.classList.add('active');
    overlay.classList.add('active');
}

function closeModel(model) {
    if (model === null)
        return;
    model.classList.remove('active');
    overlay.classList.remove('active');
}